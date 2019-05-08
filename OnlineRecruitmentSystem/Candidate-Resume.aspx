<%@ Page Title="" Language="C#" MasterPageFile="~/Site_Candidate.Master" AutoEventWireup="true" CodeBehind="Candidate-Resume.aspx.cs" Inherits="OnlineRecruitmentSystem.Candidate_Resume" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" runat="server">
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <div class="col-sm-12 col-lg-4 col-xl-3 dn-smd">
        <div class="user_profile">
            <div class="media">
                <img src="images/team/8.jpg" class="align-self-start mr-3 rounded-circle" alt="8.jpg">
                <div class="media-body">
                    <h5 class="mt-0">Hi, Martha Griffin</h5>
                    <p>Bothell, WA, USA</p>
                </div>
            </div>
        </div>
        <div class="dashbord_nav_list">
            <ul>
                <li><a href="page-candidates-dashboard.html"><span class="flaticon-dashboard"></span>Dashboard</a></li>
                <li class="active"><a href="Candidate-Profile.aspx"><span class="flaticon-profile"></span>简况</a></li>
                <li><a href="Candidate-Resume.aspx"><span class="flaticon-resume"></span>简历</a></li>
                <li><a href="Candidate-AppliedJobs.aspx"><span class="flaticon-paper-plane"></span>已投递</a></li>
                <li><a href="Candidate-CVManager.aspx"><span class="flaticon-analysis"></span>简历管理</a></li>
                <li><a href="Candidate-FavouriteJobs.aspx"><span class="flaticon-favorites"></span>喜欢的工作</a></li>
                <li><a href="Candidate-Messages.aspx"><span class="flaticon-chat"></span>消息</a></li>
                <li><a href="Candidate-Reviews.aspx"><span class="flaticon-rating"></span>状态</a></li>
                <li><a href="page-candidates-job-alert.html"><span class="flaticon-alarm"></span>Job Alerts</a></li>
                <li><a href="Candidate-ChangePassword.aspx"><span class="flaticon-locked"></span>修改密码</a></li>
                <li><a href="page-log-reg.html"><span class="flaticon-logout"></span>退出</a></li>
                <li><a href="#"><span class="flaticon-rubbish-bin"></span>Delete Profile</a></li>
            </ul>
        </div>
        <div class="skill_sidebar_widget">
            <h4>Skills Percentage <span class="float-right font-weight-bold">85%</span></h4>
            <p>Put value for "Cover Image" field to increase your skill up to "15%"</p>
            <ul class="skills">
                <li class="progressbar3" data-width="85" data-target="85"></li>
            </ul>
        </div>
    </div>
    <div class="col-sm-12 col-lg-8 col-xl-9">
        <div class="row">
            <div class="col-lg-12">
                <h4 class="fz20 mb20">My Resume</h4>
            </div>
            <div class="col-lg-12">
                <div class="candidate_resume_select">
                    <label for="exampleFormControlTextarea2">Select Your CV</label><br>
                    <asp:DropDownList ID="CVId" runat="server" CssClass="selectpicker show-tick" OnInit="CVId_Init" OnSelectedIndexChanged="CVId_SelectedIndexChanged"></asp:DropDownList>
                </div>
            </div>
            <asp:ListView ID="ResumeList" runat="server" OnItemDataBound="ResumeList_ItemDataBound">
                <ItemTemplate>
                    <div class="col-md-6 col-lg-6">
                        <div class="my_profile_input form-group">
                            <asp:Label ID="NameLabel" runat="server" Text="姓名"></asp:Label>
                            <asp:TextBox ID="Name" runat="server" CssClass="form-control" Text='<%#Eval("Name") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="my_profile_select_box form-group">
                            <asp:Label ID="GenderLabel" runat="server" Text="性别"></asp:Label>
                            <asp:DropDownList ID="Gender" runat="server" CssClass="selectpicker">
                                <asp:ListItem Value="0">男</asp:ListItem>
                                <asp:ListItem Value="1">女</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="my_profile_input form-group">
                            <label for="Mobile">电话</label>
                            <asp:TextBox ID="Mobile" runat="server" CssClass="form-control" Text='<%#Eval("Mobile") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="my_profile_input form-group">
                            <label for="Email">邮箱</label>
                            <asp:TextBox ID="Email" runat="server" CssClass="form-control" TextMode="Email" Text='<%#Eval("Email") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="my_profile_input form-group">
                            <label for="QQ">QQ</label>
                            <asp:TextBox ID="QQ" runat="server" CssClass="form-control" TextMode="Number" Text='<%#Eval("QQ") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="my_profile_select_box my_profile_input form-group">
                            <asp:Label ID="Label1" runat="server" Text="证件"></asp:Label>
                            <select class="selectpicker" id="CardType" runat="server">
                                <option value="0">身份证</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="my_profile_input form-group">
                            <label for="IdNumber">证件号</label><br>
                            <asp:TextBox ID="IdNumber" runat="server" CssClass="form-control" Text='<%#Eval("IdNumber") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="my_profile_input form-group">
                            <asp:Label ID="BrithdayLabel" runat="server" Text="生日"></asp:Label>
                            <asp:TextBox ID="Brithday" CssClass="form-control" runat="server" Text='<%#Eval("YearOfBirthday").ToString()+Eval("MonthOfBirthday").ToString()+Eval("DayOfBirthday").ToString() %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="my_profile_input form-group">
                            <asp:Label ID="WebSiteLabel" runat="server" Text="主页"></asp:Label>
                            <asp:TextBox ID="WebSite" runat="server" CssClass="form-control" Text='<%#Eval("HomePage") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="my_profile_input form-group">
                            <label for="SalaryValue">当前薪资(RMB)</label><br>
                            <asp:TextBox ID="CurrentSalary" runat="server" CssClass="form-control" Text='<%#Eval("Salary") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-2 col-lg-2">
                        <div class="my_profile_input form-group">
                            <label for="PlaceOfDomicile">居住地</label><br>
                            <asp:DropDownList ID="PlaceType1" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-2 col-lg-2">
                        <div class="my_profile_input form-group">
                            <br>
                            <asp:DropDownList ID="PlaceType2" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-2 col-lg-2">
                        <div class="my_profile_input form-group">
                            <br>
                            <asp:DropDownList ID="PlaceType3" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="my_profile_input form-group">
                            <label for="Address">详细地址</label><br>
                            <asp:TextBox runat="server" ID="Address" CssClass="form-control" Text='<%#Eval("Address") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="my_profile_input form-group">
                            <label for="Height" runat="server" >身高(cm)</label>
                            <asp:TextBox ID="Height" runat="server" CssClass="form-control" Text='<%#Eval("Height") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="my_profile_input form-group">
                            <label for="Weight" runat="server" >体重(kg)</label>
                            <asp:TextBox ID="Weight" runat="server" CssClass="form-control" Text='<%#Eval("Weight") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="my_profile_select_box form-group">
                            <label for="Marrige" runat="server">婚姻状态</label>
                            <select class="selectpicker" id="Marrige" runat="server">
                                <option value="0">未婚</option>
                                <option value="1">已婚</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="my_profile_select_box form-group">
                            <label for="WorkYear" runat="server">工作年限</label>
                            <select class="selectpicker" id="WorkYear" runat="server">
                                <option value="0">无工作经验</option>
                                <option value="1">1年</option>
                                <option value="2">2年</option>
                                <option value="3">3年</option>
                                <option value="4">4年</option>
                                <option value="4">5年以上</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="my_resume_textarea mt20">
                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">求职信</label>
                                <textarea class="form-control" id="CoverLetter" rows="9" runat="server"><%#Eval("Introduction") %>
						</textarea>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
            
            <div class="col-lg-12">
                <asp:Panel runat="server" ID="Education" CssClass="my_resume_eduarea">
                    <h4 class="title">Education <small class="float-right"><a href="#">Add New <span class="flaticon-right-arrow"></span></a></small></h4>
                    <asp:ListView runat="server" ID="Education_List" OnItemDeleting="Education_List_ItemDeleting" DeleteMethod="Education_List_DeleteItem" on>
                        <EditItemTemplate>
                            <div class="content">
                                <div class="circle"></div>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("SchoolName") %>' CssClass="edu_center">
                                    <asp:Label runat="server" Text='<%# Bind("FromYear") %>' ID="FromYear"></asp:Label>.<asp:Label runat="server" Text='<%# Bind("FromMonth") %>' ID="FromMonth"></asp:Label>-<asp:Label runat="server" Text='<%# Bind("ToYear") %>' ID="ToYear"></asp:Label>.<asp:Label runat="server" Text='<%# Bind("ToMonth") %>' ID="ToMonth"></asp:Label>
                                </asp:Label>
                                <%--<p class="edu_center" runat="server"> <small>.- .<%# Bind("ToMonth") %></small></p>--%>
                                <h4 class="edu_stats" title='<%# Eval("SubMajor") %>' runat="server" id="SubMajor"></h4>
                                <ul class="edu_stats_list float-right">

                                    <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Edit" onclick=""><span class="flaticon-edit"></span></a></li>
                                    <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Delete"><span class="flaticon-rubbish-bin"></span></a></li>
                                </ul>
                                <asp:Label runat="server" Text='<%# Bind("EduDetail") %>' ID="EduDetail"></asp:Label>
                                <%--<p></p>--%>
                            </div>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <div class="content">
                                <div class="circle"></div>
                                <p class="edu_center" runat="server"><%# Eval("SchoolName") %> <small><%# Eval("FromYear") %>.<%# Eval("FromMonth") %>- <%# Eval("ToYear") %>.<%# Eval("ToMonth") %></small></p>
                                <h4 class="edu_stats"><%# Eval("SubMajor") %></h4>
                                <ul class="edu_stats_list float-right">
                                    <li class="list-inline-item"><asp:LinkButton ID="Edit" runat="server" CommandName="Edit"><span class="flaticon-edit"></span></asp:LinkButton></li>
                                    <li class="list-inline-item"><asp:LinkButton ID="Delete" runat="server" CommandName="Delete"><span class="flaticon-rubbish-bin"></span></asp:LinkButton></li>
                                    <%--<li class="list-inline-item"><asp:Button ID="Delete" runat="server" Text="Button" CommandName="Delete" /><span class="flaticon-rubbish-bin"></span></li>--%>
                                    <%--<li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Edit" onclick=""><span class="flaticon-edit"></span></a></li>
                                    <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Delete"><span class="flaticon-rubbish-bin"></span></a></li>--%>
                                </ul>

                                <p><%# Eval("EduDetail") %></p>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                    <div class="content">
                        <div class="circle"></div>
                        <p class="edu_center" runat="server" id="SchoolName">Walters University <small>2002 - 2004</small></p>
                        <h4 class="edu_stats">Masters In Fine Arts</h4>			
                        <ul class="edu_stats_list float-right">
                            <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Edit"><span class="flaticon-edit"></span></a></li>
                            <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Delete"><span class="flaticon-rubbish-bin"></span></a></li>
                        </ul>
                        
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ipsum tellus. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>
                    </div>
                    <div class="content">
                        <div class="circle"></div>
                        <p class="edu_center">Bachlors in Fine Arts <small>2012 - 2015</small></p>
                        <h4 class="edu_stats">Tombers Collage
									
                        <ul class="edu_stats_list float-right">
                            <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Edit"><span class="flaticon-edit"></span></a></li>
                            <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Delete"><span class="flaticon-rubbish-bin"></span></a></li>
                        </ul>
                        </h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ipsum tellus. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>
                    </div>
                    <div class="content">
                        <div class="circle"></div>
                        <p class="edu_center" >Imperieal Institute of Art Direction <small>2014 - 2015</small></p>
                        <h4 class="edu_stats">Diploma In Fine Arts</h4>
									
                        <ul class="edu_stats_list float-right">
                            <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Edit"><span class="flaticon-edit"></span></a></li>
                            <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Delete"><span class="flaticon-rubbish-bin"></span></a></li>
                        </ul>
                        
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ipsum tellus. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>
                    </div>
                </asp:Panel>
            </div>
            <div class="col-lg-12">
                <asp:Panel ID="Panel1" runat="server" CssClass="my_resume_eduarea">
                    <h4 class="title">工作经验 <small class="float-right"><a href="#">Add New <span class="flaticon-right-arrow"></span></a></small></h4>
                    <div class="content">
                        <div class="circle"></div>
                        <p class="edu_center">Inwave Studio <small>2008 - 2012</small></p>
                        <h4 class="edu_stats">Masters In Fine Arts</h4>
									
                        <ul class="edu_stats_list float-right">
                            <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Edit"><span class="flaticon-edit"></span></a></li>
                            <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Delete"><span class="flaticon-rubbish-bin"></span></a></li>
                        </ul>
                        
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ipsum tellus. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>
                    </div>
                    <div class="content style2">
                        <div class="circle"></div>
                        <p class="edu_center">Wiggle CRC <small>2012 - 2015</small></p>
                        <h4 class="edu_stats">CEO Founder
									
                        <ul class="edu_stats_list float-right">
                            <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Edit"><span class="flaticon-edit"></span></a></li>
                            <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Delete"><span class="flaticon-rubbish-bin"></span></a></li>
                        </ul>
                        </h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ipsum tellus. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>
                    </div>
                </asp:Panel>
            </div>
            <div class="col-lg-12">
                <div class="row my_resume_portfolio">
                    <h4 class="title">Portfolio</h4>
                    <div class="col-sm-6 col-lg-3">
                        <div class="portfolio_item">
                            <img class="img-fluid" src="images/gallery/1.jpg" alt="1.jpg">
                            <ul class="edu_stats_list">
                                <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Edit"><span class="flaticon-edit"></span></a></li>
                                <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Delete"><span class="flaticon-rubbish-bin"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                        <div class="portfolio_item">
                            <img class="img-fluid" src="images/gallery/2.jpg" alt="2.jpg">
                            <ul class="edu_stats_list">
                                <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Edit"><span class="flaticon-edit"></span></a></li>
                                <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Delete"><span class="flaticon-rubbish-bin"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                        <div class="portfolio_item">
                            <img class="img-fluid" src="images/gallery/3.jpg" alt="3.jpg">
                            <ul class="edu_stats_list">
                                <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Edit"><span class="flaticon-edit"></span></a></li>
                                <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Delete"><span class="flaticon-rubbish-bin"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                        <div class="portfolio_upload">
                            <button class="btn"><span class="flaticon-download"></span></button>
                            <input type="file" name="myfile" />
                            <p>Upload Portfolio</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="my_resume_skill">
                    <h4 class="title">Skills</h4>
                    <input type="text" data-role="tagsinput" value="Sketch App,User Interface Design,Graphic Design,Web Design" placeholder="Add Skills">
                </div>
            </div>
            <div class="col-lg-12">
                <div class="my_resume_eduarea">
                    <h4 class="title">Awards <small class="float-right"><a href="#">Add New <span class="flaticon-right-arrow"></span></a></small></h4>
                    <div class="content">
                        <div class="circle"></div>
                        <p class="edu_center">Jan 2018</p>
                        <h4 class="edu_stats">Perfect Attendance Programs</h4>
									
                        <ul class="edu_stats_list float-right">
                            <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Edit"><span class="flaticon-edit"></span></a></li>
                            <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Delete"><span class="flaticon-rubbish-bin"></span></a></li>
                        </ul>
                        
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ipsum tellus. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>
                    </div>
                    <div class="content style2">
                        <div class="circle"></div>
                        <p class="edu_center">Dec 2019</p>
                        <h4 class="edu_stats">Top Performer Recognition
									
                        <ul class="edu_stats_list float-right">
                            <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Edit"><span class="flaticon-edit"></span></a></li>
                            <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Delete"><span class="flaticon-rubbish-bin"></span></a></li>
                        </ul>
                        </h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ipsum tellus. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
