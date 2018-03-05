<script src="../js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    function countAll() {

    }
    $(document).ready(
        function ajaxRePost(url,params){
            var message = "";
            var options={
                type:"GET",
                url:"${pageContext.request.contextPath}/person/findTotalUsers.do",
                data:{},
                async:false,
                success:function (msg) {
                    message=msg;
                }
            };
            $.ajax(options);
            alert(message);
//                    debugger;
            $("#count").text(message);
            return message;
        }
    )

    </script>

