<%@ Page Title="" Language="C#" MasterPageFile="~/Site_Candidate.Master" AutoEventWireup="true" CodeBehind="Candidate-Profile.aspx.cs" Inherits="OnlineRecruitmentSystem.Candidate_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" runat="server">
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
        <div class="my_profile_form_area">
            <div class="row">
                <div class="col-lg-12">
                    <h4 class="fz20 mb20">My Profile</h4>
                </div>
                <div class="col-lg-12">
                    <div class="my_profile_thumb_edit"></div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="my_profile_input form-group">
                        <label for="formGroupExampleInput1">Full Name</label>
                        <input type="text" class="form-control" id="formGroupExampleInput1" placeholder="Martha Griffin">
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="my_profile_input form-group">
                        <label for="formGroupExampleInput2">Job Title</label>
                        <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="UX/UI Desginer">
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="my_profile_input form-group">
                        <label for="exampleInputPhone">Phone</label>
                        <input type="email" class="form-control" id="exampleInputPhone" aria-describedby="phoneNumber" placeholder="+90 587 658 96 32">
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="my_profile_input form-group">
                        <label for="exampleFormControlInput1">Email address</label>
                        <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="my_profile_input form-group">
                        <label for="exampleFormControlInput2">Website</label>
                        <input type="email" class="form-control" id="exampleFormControlInput2" placeholder="www.careerup.com">
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="my_profile_select_box form-group">
                        <label for="exampleFormControlInput3">Current Salary($)</label><br>
                        <select class="selectpicker">
                            <option>25-30 K</option>
                            <option>25-35 K</option>
                            <option>25-40 K</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="my_profile_select_box form-group">
                        <label for="exampleFormControlInput4">Expected Salary($)</label><br>
                        <select class="selectpicker">
                            <option>45-85 K</option>
                            <option>45-85 K</option>
                            <option>45-85 K</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="my_profile_select_box form-group">
                        <label for="exampleFormControlInput5">Experience</label><br>
                        <select class="selectpicker">
                            <option>4-6 Years</option>
                            <option>4-5 Years</option>
                            <option>3-4 Years</option>
                            <option>2-3 Years</option>
                            <option>0-1 Years</option>
                            <option>None</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="my_profile_select_box form-group">
                        <label for="exampleFormControlInput6">Age</label><br>
                        <select class="selectpicker">
                            <option>04.01.1991</option>
                            <option>04.01.1991</option>
                            <option>04.01.1991</option>
                            <option>04.01.1991</option>
                            <option>04.01.1991</option>
                            <option>04.01.1991</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="my_profile_select_box form-group">
                        <label for="exampleFormControlInput7">Education Levels</label><br>
                        <select class="selectpicker">
                            <option>Certificate</option>
                            <option>Masters In Fine Arts</option>
                            <option>Bachlors in Fine Arts</option>
                            <option>Diploma In Fine Arts</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="my_profile_select_box form-group">
                        <label for="exampleFormControlInput8">Languages</label><br>
                        <select class="selectpicker" multiple data-actions-box="true">
                            <option>English</option>
                            <option>Turkish</option>
                            <option>Spanish</option>
                            <option>French</option>
                            <option>Swedish</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="my_profile_select_box form-group">
                        <label for="exampleFormControlInput2">Categories</label><br>
                        <select class="selectpicker" multiple data-actions-box="true">
                            <option>Banking</option>
                            <option>Digital&Creative</option>
                            <option>Retail</option>
                            <option>Business</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="my_profile_select_box form-group">
                        <label for="exampleFormControlInput2">Allow In Search & Listing</label><br>
                        <select class="selectpicker">
                            <option>Yes</option>
                            <option>No</option>
                        </select>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="my_resume_textarea mt20">
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Description</label>
                            <textarea class="form-control" id="exampleFormControlTextarea3" rows="9">Spent several years working on sheep on Wall Street. Had moderate success investing in Yugo's on Wall Street. Managed a small team buying and selling Pogo sticks for farmers. Spent several years licensing licorice in West Palm Beach, FL. Developed several new methods for working it banjos in the aftermarket. Spent a weekend importing banjos in West Palm Beach, FL.In this position, the Software Engineer collaborates with Evention's Development team to continuously enhance our current software solutions as well as create new solutions to eliminate the back-office operations and management challenges present
									    </textarea>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <h4 class="fz18 mb20">Social Network</h4>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="my_profile_input form-group">
                        <label for="formGroupExampleInput1">Facebook</label>
                        <input type="text" class="form-control" id="formGroupExampleInput3" placeholder="#">
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="my_profile_input form-group">
                        <label for="formGroupExampleInput1">Twitter</label>
                        <input type="text" class="form-control" id="formGroupExampleInput4" placeholder="#">
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="my_profile_input form-group">
                        <label for="formGroupExampleInput1">Linkedin</label>
                        <input type="text" class="form-control" id="formGroupExampleInput5" placeholder="#">
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="my_profile_input form-group">
                        <label for="formGroupExampleInput1">Google Plus</label>
                        <input type="text" class="form-control" id="formGroupExampleInput6" placeholder="#">
                    </div>
                </div>
                <div class="col-lg-12">
                    <h4 class="fz18 mb20">Contact Information</h4>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="my_profile_select_box form-group">
                        <label for="exampleFormControlInput9">Country</label><br>
                        <select class="selectpicker">
                            <option>United Kingdom</option>
                            <option>United State</option>
                            <option>Ukraine</option>
                            <option>Uruguay</option>
                            <option>UK</option>
                            <option>Uzbekistan</option>
                            <option>Uganda</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="my_profile_select_box form-group">
                        <label for="exampleFormControlInput9">City</label><br>
                        <select class="selectpicker">
                            <option>London</option>
                            <option>Manchester</option>
                            <option>Birmingham</option>
                            <option>Liverpool England</option>
                            <option>Bristol</option>
                            <option>City of London</option>
                            <option>Leeds</option>
                        </select>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="my_resume_textarea mt20">
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Full Address</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3">London, United Kingdom</textarea>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-lg-4">
                    <div class="my_profile_input form-group">
                        <label for="exampleInputLat">Latitude</label>
                        <input type="email" class="form-control" id="exampleInputLat1" aria-describedby="latNumber" placeholder="51.5073509">
                    </div>
                </div>
                <div class="col-md-4 col-lg-4">
                    <div class="my_profile_input form-group">
                        <label for="exampleInputLat">Longitude</label>
                        <input type="email" class="form-control" id="exampleInputLat2" aria-describedby="latNumber" placeholder="-0.12775829999998223">
                    </div>
                </div>
                <div class="col-md-4 col-lg-4">
                    <div class="my_profile_input form-group">
                        <label for="exampleInputLat">Zoom</label>
                        <input type="email" class="form-control" id="exampleInputLat3" aria-describedby="latNumber" placeholder="16">
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="h300" id="map-canvas"></div>
                </div>
                <div class="col-lg-2">
                    <div class="my_profile_input">
                        <a class="btn btn-lg btn-thm" href="#">Save Changes</a>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
