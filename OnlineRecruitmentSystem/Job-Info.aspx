<%@ Page Title="" Language="C#" MasterPageFile="~/Site_fix.Master" AutoEventWireup="true" CodeBehind="Job-Info.aspx.cs" Inherits="OnlineRecruitmentSystem.Job_Info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" runat="server">
    <!-- Candidate Personal Info-->
    <asp:ListView ID="JobInfo" runat="server" DataSourceID="ObjectDataSource1" OnSelectedIndexChanged="Header_SelectedIndexChanged" OnItemDataBound="JobInfo_ItemDataBound" OnItemCommand="JobInfo_ItemCommand" >
        <ItemTemplate>
            <section class="bgc-fa pt80 mt80 mbt45">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-xl-9">
                            <div class="candidate_personal_info style2">
                                <div class="thumb text-center">
                                    <img class="img-fluid rounded" src="images/partners/cl1.jpg" alt="cl1.jpg"><br>
                                    <br>
                                    <a class="mt25" href="#">View all jobs <span class="flaticon-right-arrow pl10"></span></a>
                                </div>
                                <div class="details">
                                    <h3><%# Eval("JobsName") %></h3>
                                    <p><asp:Label ID="SchoolName" runat="server"></asp:Label>--发布于<%#Eval("ReleaseTime").ToString() %></p>
                                    <p><asp:Label ID="EndTime" runat="server"></asp:Label><%#Eval("EndTime").ToString() %>截止</p>
                                    <ul class="address_list">
                                        <li class="list-inline-item"><span class="flaticon-location-pin"></span><a href="#"><asp:Label ID ="City" runat="server"></asp:Label></a></li>
                                        <li class="list-inline-item"><span class="flaticon-price pl20"></span><a href="#"><%#Eval("PayRangeLow").ToString() %>-<%#Eval("PayRangeHigh").ToString() %>RMB</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-xl-3">
                            <div class="candidate_personal_overview style2">
                                <asp:LinkButton ID="Apply" runat="server" CssClass="btn btn-block btn-thm mb15" AutoPostBack="true">Apply<span class="flaticon-right-arrow pl10"></span></asp:LinkButton>
                                <%--<button class="btn btn-block btn-thm mb15">Apply Now <span class="flaticon-right-arrow pl10"></span></button>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="bgc-white pb30">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-xl-8">
					<div class="row">
						<div class="col-lg-12">
							<div class="candidate_about_info style2">
								<h4 class="fz20 mb30">Job Incroduction</h4>
                                <asp:Label runat="server" CssClass="mb40"><%# Eval("Introduction") %></asp:Label>
								<p class="fwb">试讲安排:</p>
                                <asp:Label runat="server" ><%# Eval("TrialInfo") %></asp:Label>
								<p class="fwb">试讲时间:</p>
                                <asp:Label runat="server" ><%# Eval("TrialLectureTime").ToString() %></asp:Label>
                                <p class="fwb">联系方式:</p>
                                <asp:Label runat="server" ><%# Eval("Contact").ToString() %></asp:Label>
								<p class="mb60">-- You enjoy a fast paced and dynamic working environment</p>
                                <asp:LinkButton ID="Apply1" runat="server" CssClass="btn btn-block btn-thm mb15" AutoPostBack="true">Apply<span class="flaticon-right-arrow pl10"></span></asp:LinkButton>
						        <%--<button class="btn btn-lg btn-thm mb15">Apply Now <span class="flaticon-right-arrow pl10"></span></button>--%>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-xl-4">
					<h4 class="fz20 mb30">Position Information</h4>
					<div class="candidate_working_widget style2 bgc-fa">
						<%--<div class="icon text-thm"><span class="flaticon-money"></span></div>--%>
						<div class="details">
							<p class="color-black22">Offerd Salary</p>
							<p><%#Eval("PayRangeLow").ToString() %>-<%#Eval("PayRangeHigh").ToString() %>RMB</p>
						</div>
						<%--<div class="icon text-thm"><span class="flaticon-gender"></span></div>--%>
						<div class="details">
							<p class="color-black22">发布时间</p>
							<p><%#Eval("ReleaseTime").ToString() %></p>
						</div>
						<%--<div class="icon text-thm"><span class="flaticon-controls"></span></div>--%>
						<div class="details">
							<p class="color-black22">截止时间</p>
							<p><%#Eval("EndTime").ToString() %></p>
						</div>
						<%--<div class="icon text-thm"><span class="flaticon-line-chart"></span></div>--%>
						<div class="details">
							<p class="color-black22">试讲时间</p>
							<p><%#Eval("TrialLectureTime").ToString() %></p>
						</div>
					</div>
					<div class="job_info_widget">
						<ul>
							<li><span class="flaticon-24-hours-support text-thm2"></span> <span><%# ((int)((DateTime.Now-(DateTime)Eval("ReleaseTime")).TotalDays)).ToString() %></span> <span>Day</h5></li>
						</ul>
					</div>
					<%--<div class="map_sidebar_widget">
						<h4 class="fz20 mb30">Job Location</h4>
						<div class="h300" id="map-canvas"></div>
					</div>--%>
				</div>
			</div>
		</div>
	</section>
        </ItemTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="BreowseJob" TypeName="OnlineRecuitmentSystemBLL.User">
        <SelectParameters>
            <asp:QueryStringParameter Name="collegeId" QueryStringField="CollegesId" Type="String" />
            <asp:QueryStringParameter Name="jobName" QueryStringField="JobsName" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
	

	<!-- Candidate Personal Info Details-->
	


</asp:Content>
