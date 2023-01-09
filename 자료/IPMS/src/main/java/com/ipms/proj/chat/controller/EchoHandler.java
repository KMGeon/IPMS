package com.ipms.proj.chat.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.ipms.commons.ftp.vo.IntgAttachFileVO;
import com.ipms.proj.chat.service.ChatService;
import com.ipms.proj.chat.vo.ChatVO;
import com.ipms.util.FileUploadUtil;

import lombok.extern.slf4j.Slf4j;


import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@Slf4j
@Controller
@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler{
    //세션 리스트
	List<HashMap<String, Object>> rls = new ArrayList<>(); //웹소켓 세션을 담아둘 리스트 ---roomListSessions

    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

    @Autowired
    ChatService chatService;
    

    //클라이언트가 연결 되었을 때 실행
    @SuppressWarnings("unchecked")
	@Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	//소켓 연결
    			log.info(session.getUri().toString());
    			super.afterConnectionEstablished(session);
    			boolean flag = false;
    			String url = session.getUri().toString();
    			System.out.println("url : " + url);
    			String roomNo = url.split("=")[1];
    			log.info(roomNo.toString());
    			int idx = rls.size(); //방의 사이즈를 조사한다.
    			if(rls.size() > 0) {
    				for(int i=0; i<rls.size(); i++) {
    					String rN = (String) rls.get(i).get("roomNo");
    					if(rN.equals(roomNo)) {
    						flag = true;
    						idx = i;
    						break;
    					}
    				}
    			}

    			if(flag) { //존재하는 방이라면 세션만 추가한다.
    				log.info("왜안됑?true");
    				log.info("roomNo : " + roomNo);
    				HashMap<String, Object> map = rls.get(idx);
    				map.put(session.getId(), session);
    			}else { //최초 생성하는 방이라면 방번호와 세션을 추가한다.
    				log.info("왜안됑?false");
    				log.info("roomNo : " + roomNo);
    				HashMap<String, Object> map = new HashMap<String, Object>();
    				map.put("roomNo", roomNo);
    				map.put(session.getId(), session);
    				rls.add(map);
    			}

    			//세션등록이 끝나면 발급받은 세션ID값의 메시지를 발송한다.
    			JSONObject obj = new JSONObject();
    			obj.put("type", "getId");
    			obj.put("sessionId", session.getId());

    }


    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @SuppressWarnings("unchecked")
	@Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
        
        //현재 날짜를 가져다 메시지에 추가
        SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm");
        Date now = new Date();
        String nowTime1 = sdf1.format(now);
        
        //모든 유저에게 메세지 출력
    	//메시지 발송
		String msg = message.getPayload();
		JSONObject obj = jsonToObjectParser(msg);
		log.info("fileData: "+obj.toString());
		Object fileData = obj.get("fileData");
		String fileMsg = fileData.toString();
		
		//file이 없을때 전송
		if(fileMsg.equals("noData;")) {
		ChatVO chatVO = new ChatVO();
		chatVO.setChatRoomId((String) obj.get("roomNo"));
		chatVO.setChatCts((String) obj.get("message"));
		chatVO.setWriter((String) obj.get("id"));
		int result = chatService.insertChat(chatVO);
		log.info("chatInsert: "+result);
		}
		
		
		obj.put("date", nowTime1);
		
		String rN = (String) obj.get("roomNo");
		HashMap<String, Object> temp = new HashMap<String, Object>();
		if(rls.size() > 0) {
			for(int i=0; i<rls.size(); i++) {
				String roomNo = (String) rls.get(i).get("roomNo"); //세션리스트의 저장된 방번호를 가져와서
				if(roomNo.equals(rN)) { //같은값의 방이 존재한다면
					temp = rls.get(i); //해당 방번호의 세션리스트의 존재하는 모든 object값을 가져온다.
					break;
				}
			}
			//해당 방의 세션들만 찾아서 메시지를 발송해준다.
			for(String k : temp.keySet()) {
				if(k.equals("roomNo")) { //다만 방번호일 경우에는 건너뛴다.
					continue;
				}
				WebSocketSession wss = (WebSocketSession) temp.get(k);
				if(wss != null) {
					try {
						wss.sendMessage(new TextMessage(obj.toJSONString()));
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
      }

    //클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	//소켓 종료
    			if(rls.size() > 0) { //소켓이 종료되면 해당 세션값들을 찾아서 지운다.
    				for(int i=0; i<rls.size(); i++) {
    					log.info("delete: "+session.getId());
    					rls.get(i).remove(session.getId());
    				}
    			}
    			super.afterConnectionClosed(session, status);
    }

    private static JSONObject jsonToObjectParser(String jsonStr) {
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject) parser.parse(jsonStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return obj;
	}
}
