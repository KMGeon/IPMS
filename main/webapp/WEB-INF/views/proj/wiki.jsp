<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<div class="container">
	<div class="row">
		<div class="col-10">
		</div>

		<div class="col-2 float-right">
			<div id="tree"></div>

		</div>
	</div>
</div>
<script>
$("#tree").jstree({
    "core" : {
        "themes" : {
            "responsive": true
        },
        // so that create works
        "check_callback" : true,
        'data': [{
                "text": "Parent Node",
                "a_attr":{"href":"google.com"},
                "children": [{
                    "text": "Initially selected",
                    "a_attr":{"href":"google.com"},
                    "state": {
                        "selected": true
                    }
                }, {
                    "text": "Custom Icon",
                    "a_attr":{"href":"google.com"},
                    "icon": "fonticon-attach text-danger fs-4"
                }, {
                    "text": "Initially open",
                    "icon" : "fa fa-folder text-success",
                    "a_attr":{"href":"google.com"},
                    "state": {
                        "opened": false
                    },
                    "children": [
                        {"text": "Another node", "icon" : "fa fa-file text-waring","a_attr":{"href":"google.com"},}
                    ]
                }, {
                    "text": "Another Custom Icon",
                    "a_attr":{"href":"google.com"},
                    "icon": "fonticon-link text-waring fs-4"
                }, {
                    "text": "Disabled Node",
                    "a_attr":{"href":"google.com"},
                    "icon": "fa fa-check text-success",
                    "state": {
                        "disabled": true
                    }
                }, {
                    "text": "Sub Nodes",
                    "a_attr":{"href":"google.com"},
                    "icon": "fa fa-folder text-danger",
                    "children": [
                        {"text": "Item 1", "icon" : "fa fa-file text-waring"},
                        {"text": "Item 2", "icon" : "fa fa-file text-success"},
                        {"text": "Item 3", "icon" : "fa fa-file text-default"},
                        {"text": "Item 4", "icon" : "fa fa-file text-danger"},
                        {"text": "Item 5", "icon" : "fa fa-file text-info"}
                    ]
                }]
            },
            "Another Node"
        ]
    },
    "types" : {
        "default" : {
            "icon" : "fa fa-folder text-primary"
        },
        "file" : {
            "icon" : "fa fa-file  text-primary"
        }
    },
    "state" : { "key" : "demo2" },
    "plugins" : [ "contextmenu", "state", "types" ]
});
$("#tree").on("click", ".jstree-anchor", function(evt)
		{
		    var link = $(evt.target).attr("href");
		    location.href = link;
		});
</script>
