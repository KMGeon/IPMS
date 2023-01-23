package com.ipms.commons.ftp;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.SocketException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;
import org.springframework.web.multipart.MultipartFile;

import com.ipms.commons.ftp.vo.IntgAttachFileVO;
import com.ipms.commons.vo.FtpVO;
import com.ipms.proj.docs.vo.DocsVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class FtpUtil {
	
	// FTP 서버의 아이피 주소
	private static final String host = "192.168.142.9"; // 서버 컴 : 192.168.142.9, 192.168.42.49
	// FTP 포트번호 (기본값 21)
	private static final int port = 21;
	// user name
	private static final String user = "finalproj"; // 서버 컴 : finalproj
	// user password
	private static final String pwd = "java";
	
	/**
	 * FTP 서버에 접속이 되면 FTPClient 반환
	 * @return FTPClient ftp
	 * @throws SocketException 
	 * @throws IOException
	 */
	public static FTPClient ftpServerConnect() {
		
		// commons-net으로 FTPClient 생성
		FTPClient ftp = null;
		ftp = new FTPClient();
		
		ftp.setControlEncoding("UTF-8");
		
		// 응답 코드를 담는 변수
		int reply = 0;
		
		// 호스트 연결
		try {
			ftp.connect(host, port);
		} catch (IOException e) {
			log.error("FtpUtil - ftpServerConnect -> FTP 서버 호스트 연결 에러");
			e.printStackTrace();
		}
		
		// 응답코드 체크
		reply = ftp.getReplyCode();
		
		// 연결 체크
		if(!FTPReply.isPositiveCompletion(reply)) { // 비정상 연결
			try {
				ftp.disconnect();
			} catch (IOException e) {
				log.error("FtpUtil - ftpServerConnect -> 비정상적인 FTP 서버 연결");
				e.printStackTrace();
			}
		}
		
		try {
			ftp.login(user, pwd);
			ftp.setFileType(FTP.BINARY_FILE_TYPE);
			ftp.enterLocalPassiveMode();
		} catch (IOException e) {
			log.error("FtpUtil - ftpServerConnect -> FTP 서버 로그인 에러");
			e.printStackTrace();
		}
		
		return ftp;
		
	}
	
	
	
	/**
	 * 폴더 생성
	 * 추후 폴더를 생성하는 경로 파라미터 추가
	 * @param foldName
	 * @return
	 */
	public static boolean ftpDocsMkdir(String path, String foldName) {
		
		boolean flag = false;
		
		FTPClient ftp = ftpServerConnect();
		
		try {
			FTPFile[] ftpFiles = ftp.listFiles();
			
			for(int i = 0; i < ftpFiles.length; i++) {
				FTPFile ftpFile = ftpFiles[i];
				
				log.info("FtpUtil - docsMkdir -> FTP SERVER DIR LIST {}", ftpFile.getName());
				
			}
			
			ftp.changeWorkingDirectory(path);
			log.info("FtpUtil - ftpDocsMkdir -> 현재 작업디랙토리는 {}", ftp.printWorkingDirectory());
			
			// 나중에 프로젝트 아이디와 폴더함 번호 받아서 프로젝트 별 폴더 생성 구현하기
			flag = ftp.makeDirectory(foldName);
			
		} catch (IOException e) {
			log.error("FtpUtil - docsMkdir -> FTP 폴더 만들기 오류");
			e.printStackTrace();
		} finally {
			try {
				ftp.disconnect();
			} catch (IOException e) {
				log.error("FtpUtil - docsMkdir -> FTP 서버 접속 종료 에러");
				e.printStackTrace();
			}
		}
		
		
		return flag;
	}
	
	
	/**
	 * 파일 업로드 메소드
	 * 추후 파일을 업로드하는 경로를 파라미터로 추가
	 * @param file : input 태그 파라미터
	 */
	public static void ftpFileUpload(MultipartFile file) {
		
		FTPClient ftp = ftpServerConnect();
		
		try(InputStream is = file.getInputStream();
				OutputStream os = ftp.storeFileStream(file.getOriginalFilename());
				BufferedInputStream bis = new BufferedInputStream(is);
				BufferedOutputStream bos = new BufferedOutputStream(os);
			) {
			
			// 나중에 경로를 바꾸자
//			ftp.changeWorkingDirectory("/");
			byte[] buffer = new byte[1024];
			int length = -1;
			
			while( (length = bis.read(buffer, 0, buffer.length)) != -1) {
				bos.write(buffer, 0, length);
			}
			
		} catch (IOException e) {
			log.error("FtpUtil - ftpFileUpload -> FTP 파일 생성 오류");
			e.printStackTrace();
		}finally {
			try {
				ftp.disconnect();
			} catch (IOException e) {
				log.error("FtpUtil - ftpFileUpload -> FTP 서버 접속 종료 에러");
				e.printStackTrace();
			}
			
		}
		
	}
	
	/**
	 * 폴더만 조회 
	 * @param path
	 * @return
	 */
	public static List<DocsVO> ftpGetDir(String path) {
		
		FTPClient ftp = ftpServerConnect();
		
		List<DocsVO> docsVOList = null;
		String temp = "";
		
		log.info("FtpUtil - ftpGetDir -> path : {}", path);
		
		if(!path.equals("/")) {
			temp += "/" + path;
		}
		
		log.info("FtpUtil - ftpGetDir -> temp : {}", temp);
		
		try {
			ftp.changeWorkingDirectory(temp);
			FTPFile[] files = ftp.listFiles();
			docsVOList = new ArrayList<DocsVO>();
			
			for(FTPFile file : files) {
				DocsVO docsVO = new DocsVO();
				
				if(file.isDirectory()) {
					docsVO.setFoldName(file.getName());
					docsVOList.add(docsVO);
				}
				
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return docsVOList;
		
	}
	
	/**
	 * 파일만 조회
	 * @param path
	 * @return
	 */
	public static List<IntgAttachFileVO> ftpGetFile(String path) {
		
		FTPClient ftp = ftpServerConnect();
		
		List<IntgAttachFileVO> intgAttachFileVOList = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date regDate = null;
		
		try {
			ftp.changeWorkingDirectory(path);
			FTPFile[] files = ftp.listFiles();
			intgAttachFileVOList = new ArrayList<IntgAttachFileVO>();
			
			for(FTPFile file : files) {
				IntgAttachFileVO intgAttachFileVO = new IntgAttachFileVO();
				
				if(file.isFile()) {
					intgAttachFileVO.setFileName(file.getName());
					intgAttachFileVO.setFileSize(file.getSize());
					
					regDate = file.getTimestamp().getTime();
					intgAttachFileVO.setRgstDate(regDate);
					
					intgAttachFileVOList.add(intgAttachFileVO);
				}
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return intgAttachFileVOList;
	}
	
	// ========================== 여기서 부터 새로 시작 ===================================
	public static List<FtpVO> getList(String path) {
		
		FTPClient ftp = ftpServerConnect();
		
		List<FtpVO> ftpVOList = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date regDate = null;
		String tempDate;
		
		try {
			ftp.changeWorkingDirectory(path);
			FTPFile[] listFiles = ftp.listFiles();
			
			ftpVOList = new ArrayList<FtpVO>();
//			int parentId = 0;
			for(FTPFile file : listFiles) {
				FtpVO ftpVO = new FtpVO();
//				if(file.isDirectory() == true) {
//					ftp.changeWorkingDirectory(path+"/"+file.getName());
//					FTPFile[] rowListFiles = ftp.listFiles();
//					for (FTPFile ftpFile : rowListFiles) {
//						
//					}
					
				ftpVO.setText(file.getName());
				ftpVO.setSize(file.getSize());
				
				regDate = file.getTimestamp().getTime();
				tempDate = sdf.format(regDate);
				
				ftpVO.setRegDate(tempDate);
				if(file.isDirectory()) {
					ftpVO.setDir(true);
				}
				
				ftpVOList.add(ftpVO);
					
			}
//				parentId++;
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return ftpVOList;
	}
	
	// 파일 존재 여부 boolean
	public static boolean isDirectoryExist(String path, String dirName) {
		
		log.info("[isDirectoryExist] isFileExist parameter");
		log.info("[isDirectoryExist] param > path : {}", path);
		log.info("[isDirectoryExist] param > fileName : {}", dirName);
		
		FTPClient ftpClient = ftpServerConnect();
		
		boolean flag = false;
		
		try {
			
			boolean moveDir = ftpClient.changeWorkingDirectory(path);
			log.debug("[isDirectoryExist] moveDir : {} > {}", path, moveDir);
				
			
			FTPFile[] files = ftpClient.listDirectories();
			
			for(FTPFile file : files) {
				if(file.getName().equals(dirName)) {
					flag = true;
					break;
				}
			} // for end
			
		} catch (IOException e) {
			throw new RuntimeException(e);
		} finally {
			try {
				ftpClient.disconnect();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
		log.debug("[isDirectoryExist] return : {}", flag);
		return flag;
	}
	
	// 폴더 생성
	public static boolean createDirectory(String path, String dirName) {
		
		log.info("[createDirectory] createDirectory parameter");
		log.info("[createDirectory] param > path : {}", path);
		log.info("[createDirectory] param > dirName : {}", dirName);
		
		FTPClient ftpClient = ftpServerConnect();

		boolean moveDir = false;
		boolean makeResult = false;
		try {
			moveDir = ftpClient.changeWorkingDirectory(path);
			log.debug("[createDirectory] moveDir : {} > {}", path, moveDir);
			if(!moveDir) {
				throw new RuntimeException("can't move directory...");
			}
			makeResult = ftpClient.makeDirectory(dirName);
		} catch (IOException e) {
			log.error("[createDirectory] move directory error : {}", e.getMessage());
			throw new RuntimeException(e);
		} finally {
			try {
				ftpClient.disconnect();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
			
		return makeResult;
	}
	
	// 파일 생성
	public static void uploadToFtp(String savePath, String saveName, MultipartFile docsfile) {
		
		if(docsfile==null) return;
		
		FTPClient ftp = ftpServerConnect();
		
		try {
			boolean moveDir = ftp.changeWorkingDirectory(savePath);
			log.debug("[uploadToFtp] - moveDir -> {}", moveDir);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		try (
				InputStream is = docsfile.getInputStream();
				OutputStream os = ftp.storeFileStream(saveName);
			){
				
				log.debug("[uploadToFtp] stream working...");
				byte[] buffer = new byte[1024];
				int length = -1;
				while( (length = is.read(buffer, 0, buffer.length)) != -1 ) {
					os.write(buffer, 0, length);
				}
				log.debug("[uploadToFtp] stream working end...");
				
			} catch (Exception e) {
				log.error("[uploadToFtp] stream error : {}", e.getMessage());
				throw new RuntimeException(e);
			} finally {
				
				try {
					ftp.disconnect();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				log.debug("[uploadToFtp] ftpClient return...");
				
			}
		
		}
		
		// 파일 다운로드
		public static byte[] getFileByte(String savePath, String saveName) {
			
			FTPClient ftp = ftpServerConnect();
			
			boolean moveDir = false;
			byte[] byteArray = null;
			
			try {
				moveDir = ftp.changeWorkingDirectory(savePath);
				
				log.debug("FtpUtil - getFileByte -> {}", moveDir);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			try (
					
				InputStream is = ftp.retrieveFileStream(saveName);
				ByteArrayOutputStream os = new ByteArrayOutputStream();
					
			){
				
				byte[] buffer = new byte[1024];
				int length = -1;
				log.debug("[getFileByte] stream working start...");
				while( (length = is.read(buffer, 0, buffer.length)) != -1 ) {
					os.write(buffer, 0, length);
				}
				log.debug("[getFileByte] stream working end...");
				
				byteArray = os.toByteArray();
				
			} catch (Exception e) {
				log.debug("[getFileByte] stream error : {}", e.getMessage());
				throw new RuntimeException(e);
			} finally {
				try {
					ftp.disconnect();
				} catch (IOException e) {
					e.printStackTrace();
				}
				log.debug("[uploadToFtp] ftpClient return...");
			}
			
			return byteArray;
			
		}
		
		// 삭제
		public static boolean removeFiles(String path, String saveName) {

			FTPClient ftp = ftpServerConnect();

			boolean result = false;
			
			try {
				result = removeFileOne(ftp, path, saveName);
			} finally {
				try {
					ftp.disconnect();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			return result;
		}

		public static boolean removeFileOne(FTPClient ftp, String path, String saveName) {

			boolean flag = true;
			
			try {
				boolean result = ftp.changeWorkingDirectory(path);
				log.info("FtpUtil - removeFileOne -> result : ", result);
				FTPFile[] files = ftp.listFiles();
				for (FTPFile file : files) {
					if (file.getName().equals(saveName)) {
						String filePath = path + "/" + saveName;
						if (file.isDirectory()) {
							boolean dirResult = removeDir(ftp, filePath);
							if (dirResult) {
								flag = ftp.removeDirectory(filePath);
							}
						} else {
							flag = ftp.deleteFile(filePath);
						}
					}
				}

			} catch (IOException e) {
				throw new RuntimeException(e);
			}
			return flag;
		}
		
		// 재귀호출(폴더 삭제시 밑에 파일을 다 삭제하고 폴더를 삭제 해야 함)
		public static boolean removeDir(FTPClient ftp, String path) {
			
			boolean flag = true;
			
			try {
				boolean result = ftp.changeWorkingDirectory(path);
				
				FTPFile[] files = ftp.listFiles();
				
				for(FTPFile file : files) {
					
					String filePath = path + "/" + file.getName();
					
					if(file.isDirectory()) {
						boolean dirResult = removeDir(ftp, filePath);
						
						if(dirResult) {
							flag = ftp.removeDirectory(filePath);
						}
					}else {
						flag = ftp.deleteFile(filePath);
					}
					
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return flag;
			
		}
	
	// ========================== 여기서 부터 새로 끝  ===================================
}
