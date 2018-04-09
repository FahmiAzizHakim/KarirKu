    <body>
        
        <div class="registration-container registration-extended">            
            <div class="registration-box animated fadeInDown">
                <div style="text-align: center;"><h1 style="color: white !important;">KarirKu.Id</h1></div>
                <div class="registration-body">
                    
                    <div class="row">                        
                        <div class="col-md-6">
                            
                           <div class="registration-title"><strong>Welcome</strong>, Please login</div>
                           <br /><br />
                            <div class="form-horizontal" method="post">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <input id="user_code" name="user_code" type="text" class="form-control" placeholder="Username / Email"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <input id="user_password" name="user_password" type="password" class="form-control" placeholder="Password"/>
                                </div>
                            </div>
                            <div class="form-group push-down-30">
                                <div class="col-md-6">
                                    <a href="#" class="btn btn-link btn-block">Forgot your password?</a>
                                </div>
                                <div class="col-md-6">
                                    <button id="BtnLogin" class="btn btn-info btn-block">Log In</button>
                                </div>
                            </div>
                            </div> 
                            
                        </div>
                        <div class="col-md-6">
                            
                            <div class="registration-title"><strong>Registration</strong></div>
                            <div class="registration-subtitle"></div>
                            <div class="form-horizontal" method="post">

                                <h4>Personal info</h4>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input id="field_name" type="text" class="form-control" placeholder="First Name"/>
                                    </div>
                                </div>
                                    <div class="form-group">
                                    <div class="col-md-12">
                                        <input id="field_name2" type="text" class="form-control" placeholder="Last Name"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input id="field_code" type="text" class="form-control" placeholder="E-mail"/>
                                    </div>
                                </div>

                                <h4>Authentication</h4>                     
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input id="field_password" type="password" class="form-control" placeholder="Password"/>
                                    </div>
                                </div>                    
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input id="field_password2" type="password" class="form-control" placeholder="Retype-Password"/>
                                    </div>
                                </div>             

                                <div class="form-group push-up-30">
                                    <div class="col-md-6">
                                        <a href="#" class="btn btn-link btn-block">Already have an account?</a>
                                    </div>
                                    <div class="col-md-6">
                                        <button id="BtnSignUp" class="btn btn-danger btn-block">Sign Up</button>
                                    </div>
                                </div>
                                
                            </div>                            
                            
                        </div>
                    </div>
                    
                </div>
                
                <div class="registration-footer">
                    <div class="pull-left">
                        &copy; 2015 AppName
                    </div>
                    <div class="pull-right">
                        <a href="#">About</a> |
                        <a href="#">Privacy</a> |
                        <a href="#">Contact Us</a>
                    </div>
                </div>
            </div>
            
        </div>
        
<script type="text/javascript">
    {literal}
    $("#BtnSignUp").click(function(){
    {/literal}
        var api_url = '{$api_url}';
    {literal}
        if($("#field_name").val() == "" || $("#field_name2").val() == ""){
            alert("Nama Harus Diisi");
            $("#field_name").focus();
            return false;
        };
        if($("#field_code").val() == ""){
            alert("User Code Harus Diisi");
            $("#field_code").focus();
            return false;
        };
        if($("#field_password").val() == ""){
            alert("Password Harus Diisi");
            $("#field_password").focus();
            return false;

        };
        if($("#field_password2").val() != $("#field_password").val()){
            alert("Password Harus Sama");
            $("#field_password").focus();
            return false;
            
        };


        noty({text: 'Loading', layout: 'topCenter'});
        $("#BtnSignUp").attr("disabled", true);

        $.ajax({
            type: "POST",
            url: api_url + "Master_data/field_insert_user",
            dataType: "json",
            data: { field_name : $("#field_name").val() + " " + $("#field_name2").val(),
                    field_code : $("#field_code").val(),
                    field_password : $("#field_password").val(),
                    field_role : 'User',
                    activestatus : 'ATSAC',
                    created_by : $("#field_name").val(),
                    company_code : 'RDCNT' },
            success: function(data) {
                $("#BtnSignUp").removeAttr("disabled");
                $("#noty_topCenter_layout_container").remove();

                if(data.status == "success")
                {
                    alert("Data Berhasil Diproses, Silahkan Login");
                    $("#user_code").val($('#field_code').val());
                    $("#user_password").val($("#field_password").val());
                    $("#field_name").val('');
                    $("#field_name2").val('');
                    $("#field_code").val('');
                    $("#field_password").val('');
                    $("#field_password2").val('');
                }
                else
                {
                    alert("Data Gagal Diproses, Harap Hubungin Call Center");
                }

            }
        });
    });
    

    $("#BtnLogin").click(function(){
        {/literal}
        var base_url = '{$base_url}';
        {literal}
        if($("#user_code").val() == ""){
            alert("Username / Email Harus Diisi");
            $("#user_code").focus();
            return false;
        };
        if($("#user_password").val() == ""){
            alert("Password Harus Diisi");
            $("#user_password").focus();
            return false;
        };

        noty({text: 'Loading', layout: 'topCenter'});
        $("#BtnLogin").attr("disabled", true);

        $.ajax({
            type: "POST",
            url: base_url + "Login/check_user",
            dataType: "json",
            data: { username : $("#user_code").val(),
                    password : $("#user_password").val()},
            success: function(data) {
                $("#BtnLogin").removeAttr("disabled");
                $("#noty_topCenter_layout_container").remove();
                alert(data.status);

                if(data.status == "success")
                {
                    window.location.href = base_url + "Timeline";
                }
                else
                {
                    alert($data.error);
                }

            }
        });
    });
    {/literal}
            
        </script>
    </body>
</html>






