<%--
  Created by IntelliJ IDEA.
  User: abg14
  Date: 2022-12-07
  Time: 오전 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <!--bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
            crossorigin="anonymous"></script>

    <style>
        .box {
            position: relative;
            margin: auto;
        }

        #box1 {
            overflow-y: scroll;
            -ms-overflow-style: none;
            width: 300px;
            height: 400px;
            background-color: skyblue;
        }

        ::-webkit-scrollbar {
            display: none;
        }

        #box2 {
            width: 300px;
            height: 100px;
            background-color: aliceblue;
        }

        #inputText {
            position: relative;
            left: 0;
            width: 200px;
            height: 80px;
            padding: 10px;
            float: left;
            font-size: smaller;
        }

        .text {
            background-color: yellow;
            border-radius: 5px;
            padding: 5px;
            font-size: small;
        }

        .textBox {
            margin: 10px;
            max-width: 70%;
        }

        .time {
            font-size: xx-small;
            color: rgb(41, 41, 43);
            position: relative;
            align-content: flex-end;
        }

        #emoBox {
            width: 80px;
            height: 100%;
            position: absolute;
            right: 0;
        }

        #emoBtn > img {
            position: absolute;
            width: 70px;
            height: 70px;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            border-radius: 5px;
        }

        #emoBtn > img:hover {
            cursor: pointer;
        }

        #emosBox {
            box-sizing: border-box;
            position: absolute;
            width: 300px;
            height: 100px;
            top: -100px;
            background-color: rgba(243, 243, 243, 0.607);
        }

        .emosImg {
            position: absolute;
            width: 80px;
            height: 80px;
            border-radius: 5px;
        }

        .emosImg:hover {
            cursor: pointer;
            width: 90px;
            height: 90px;
        }

        #emo1 {
            top: 50%;
            transform: translate(10%, -50%);
        }

        #emo2 {
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }

        #emo3 {
            right: 0;
            top: 50%;
            transform: translate(-10%, -50%);
        }

        .emoInput {
            width: 50px;
            height: 50px;
            padding: 2px;
            padding-bottom: 0;
            border-radius: 5px;
        }

        .user_name {
            font-size: xx-small;
        }
    </style>
</head>
<body>
<div class="box" id="box1">

</div>
<div class="box" id="box2">

    <div id="emosBox">
        <img class="emosImg" id="emo1"
             src="data:image/jpeg;base64,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"
             alt="">
        <img class="emosImg" id="emo2"
             src="data:image/jpeg;base64,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"
             alt="">
        <img class="emosImg" id="emo3" src="https://i.pinimg.com/236x/40/f4/8b/40f48b55c85c4050c1078fcb8dec645b.jpg"
             alt="">
    </div>

    <div id="inputText" contenteditable="true"></div>
    <script>
        $(function () {
            var ws = new WebSocket("ws://192.168.150.48/chat"); // WebSocket 인스턴스 생성

            ws.onmessage = function (e) {

                let data = JSON.parse(e.data);
                console.log(data);
                var today = new Date();
                var hours = ('0' + today.getHours()).slice(-2);
                var minutes = ('0' + today.getMinutes()).slice(-2);
                var timeString = hours + ':' + minutes;

                $("#box1")
                    .append(
                        $("<div>").addClass("textBox")
                            .append(
                                $("<table>")
                                    .append(
                                        $("<tr>")
                                            .append(
                                                $("<td>").addClass("user_name").append(data.sender)
                                            )
                                    )
                                    .append(
                                        $("<tr>")
                                            .append(
                                                $("<td>").addClass("text").append(data.msg)
                                            )
                                            .append(
                                                $("<td>")
                                                    .append(
                                                        $("<span>").addClass("time").append(timeString)
                                                    )
                                            )
                                    )
                            )
                    )
                $("#box1").scrollTop($("#box1")[0].scrollHeight);
            };

            $("#inputText").on("keydown", function (e) {
                if (e.keyCode == 13 && e.shiftKey == false) {
                    return false;
                }
            });

            $("#inputText").on("keydown", function (e) {

                if (e.keyCode == 13 && e.shiftKey == false && $("#inputText").html() != "") {
                    let text = $("#inputText").html();
                    ws.send(text);
                    $("#inputText").html("").focus();
                    return false;
                }
            });
        });

    </script>
    <div id="emoBox"><label id="emoBtn" for="emoCheck"><img id="emoImg"
                                                            src="data:image/jpeg;base64,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"
                                                            alt=""></label></div>
    <input id="emoCheck" type="checkbox" style="display: none">

    <script>
        $("#emosBox").hide();

        $("#emoBtn").on("click", function () {
            if (!($("#emoCheck").is(':checked'))) {
                let url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGrFCyGWkjbPiG9SPAwy6QMGa8oL_F8JZXyw&usqp=CAU";
                $("#emoImg").attr("src", url);
                $("#emosBox").show();
            } else {
                emoHide();
            }
            $("#inputText").focus();
        })

        $(".emosImg").on("click", function () {
            console.log($(this).clone())
            $("#inputText").append(
                $(this).clone().attr("class", "emoInput").attr("id", "")
            )
            const el = document.getElementById("inputText");
            const selection = window.getSelection();
            const range = document.createRange();
            selection.removeAllRanges();
            range.selectNodeContents(el);
            range.collapse(false);
            selection.addRange(range);
            el.focus();

            emoHide();
        });

        function emoHide() {
            let url = "data:image/jpeg;base64,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";
            $("#emoImg").attr("src", url);
            $("#emosBox").hide();
        }
    </script>
</div>

</body>
</html>
