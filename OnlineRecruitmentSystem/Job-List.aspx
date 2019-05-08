<%@ Page Title="" Language="C#" MasterPageFile="~/Site_fix.Master" AutoEventWireup="true" CodeBehind="Job-List.aspx.cs" Inherits="OnlineRecruitmentSystem.Job_List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" runat="server">
    <section class="our-faq bgc-fa mt50">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-xl-3 dn-smd">
					<div class="faq_search_widget mb30">
						<h4 class="fz20 mb15">Search Keywords</h4>
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="e.g. web design" aria-label="Recipient's username" aria-describedby="button-addon2">
							<div class="input-group-append">
						    	<button class="btn btn-outline-secondary" type="button" id="button-addon2"><span class="flaticon-search"></span></button>
							</div>
						</div>
					</div>

					<div class="cl_latest_activity mb30">
						<h4 class="fz20 mb15">Date Posted</h4>
						<div class="ui_kit_radiobox">
							<div class="radio">
								<input id="radio_one" name="radio" type="radio" checked="">
								<label for="radio_one"><span class="radio-label"></span> Last Hour</label>
							</div>
							<div class="radio">
								<input id="radio_two" name="radio" type="radio">
								<label for="radio_two"><span class="radio-label"></span> Last 24 hours</label>
							</div>
							<div class="radio">
								<input id="radio_three" name="radio" type="radio">
								<label for="radio_three"><span class="radio-label"></span> Last 7 days</label>
							</div>
							<div class="radio">
								<input id="radio_four" name="radio" type="radio">
								<label for="radio_four"><span class="radio-label"></span> Last 14 days</label>
							</div>
							<div class="radio">
								<input id="radio_five" name="radio" type="radio">
								<label for="radio_five"><span class="radio-label"></span> Last 30 days</label>
							</div>
							<a class="text-thm2 pl30" href="#">View All <span class="flaticon-right-arrow pl10"></span></a>
						</div>
					</div>
					<div class="cl_latest_activity mb30">
						<h4 class="fz20 mb15">Job Type</h4>
						<div class="ui_kit_whitchbox">
							<div class="custom-control custom-switch">
								<input type="checkbox" class="custom-control-input" id="customSwitch1">
								<label class="custom-control-label" for="customSwitch1">Freelance</label>
							</div>
							<div class="custom-control custom-switch">
								<input type="checkbox" class="custom-control-input" id="customSwitch2">
								<label class="custom-control-label" for="customSwitch2">Full Time</label>
							</div>
							<div class="custom-control custom-switch">
								<input type="checkbox" class="custom-control-input" id="customSwitch3">
								<label class="custom-control-label" for="customSwitch3">Part Time</label>
							</div>
							<div class="custom-control custom-switch">
								<input type="checkbox" class="custom-control-input" id="customSwitch4">
								<label class="custom-control-label" for="customSwitch4">Internship</label>
							</div>
							<div class="custom-control custom-switch">
								<input type="checkbox" class="custom-control-input" id="customSwitch5">
								<label class="custom-control-label" for="customSwitch5">Temporary</label>
							</div>
						</div>
					</div>
					<div class="cl_pricing_slider mb30">
						<h4 class="fz20 mb20">Hourly Rate</h4>
						<div id="slider-range"></div>
						<p class="text-center">
							<input class="sl_input" type="text" id="amount">
						</p>
					</div>
				</div>
				<div class="col-md-12 col-lg-9 col-xl-9">
					<div class="row">
						<div class="col-lg-12 mb30">
							<h4 class="fz20 mb15">Your Selected</h4>
							<div class="tags-bar">
						 		<span>Design<i class="close-tag">x</i></span>
						 		<span>UX/UI<i class="close-tag">x</i></span>
						 		<div class="action-tags">
						 			<a href="#"><i class="fa fa-trash-o"></i> Clean All</a>
						 		</div>
						 	</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12 col-lg-6">
							<div class="candidate_job_alart_btn">
								<h4 class="fz20 mb15">20 Candidates Found</h4>
								<a class="btn btn-thm" href="#"><span class="flaticon-mail"></span> Get Job Alerts</a>
								<button class="btn btn-thm btns dn db-991 float-right">Show Filter</button>
							</div>
						</div>
						<div class="col-sm-12 col-lg-6">
							<div class="content_details">
								<div class="details">
									<a href="javascript:void(0)" class="closebtn" onclick="closeNav()"><span>Hide Filter</span><i>×</i></a>
									<div class="faq_search_widget mb30">
										<h4 class="fz20 mb15">Search Keywords</h4>
										<div class="input-group mb-3">
											<input type="text" class="form-control" placeholder="Find Your Question" aria-label="Recipient's username" aria-describedby="button-addon2">
											<div class="input-group-append">
										    	<button class="btn btn-outline-secondary" type="button" id="button-addon4"><span class="flaticon-search"></span></button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
                        <asp:ListView ID="JobsList" runat="server" DataSourceID="ObjectDataSource1" OnItemDataBound="JobsList_ItemDataBound">
                            <EmptyDataTemplate>
                                <table runat="server" style="">
                                    <tr>
                                        <td>未找到数据。</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <ItemTemplate>
                                <div class="col-lg-12 mt30">
                                    <div class="fj_post style2">
                                        <div class="details">
                                            <div class="thumb fn-smd">
                                                <img class="img-fluid" src="images/partners/1.jpg" alt="1.jpg">
                                            </div>
                                            <h4><%#Eval("JobsName") %></h4>
                                            <p><asp:Label ID="SchoolName" runat="server"></asp:Label>发布于<%#Eval("ReleaseTime").ToString() %></p>
                                            <ul class="featurej_post">
                                                <li class="list-inline-item"><span class="flaticon-location-pin"></span><a href="#"><asp:Label ID ="City" runat="server"></asp:Label></a></li>
                                                <li class="list-inline-item"><span class="flaticon-price pl20"></span><a href="#"><%#Eval("PayRangeLow").ToString() %>-<%#Eval("PayRangeHigh").ToString() %>RMB</a></li>
                                            </ul>
                                        </div>
                                        <asp:LinkButton runat="server" CssClass="btn btn-md btn-transparent2 float-right fn-smd" Text="查看" ID="Browse"></asp:LinkButton>
                                        <%--<a class="btn btn-md btn-transparent2 float-right fn-smd" href="#" id="Browse" >查看</a>--%>
                                    </div>
                                </div>
                            </ItemTemplate>

                        </asp:ListView>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectJobsInfoByJobName" TypeName="OnlineRecuitmentSystemBLL.User">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="jobName" QueryStringField="key" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
						<div class="col-lg-12 mt30">
							<div class="fj_post style2">
								<div class="details">
									<h5 class="job_chedule text-thm">Full Time</h5>
									<div class="thumb fn-smd">
										<img class="img-fluid" src="images/partners/1.jpg" alt="1.jpg">
									</div>
									<h4>JEB Product Sales Specialist, Russia & CIS</h4>
									<p>Posted 23 August by <a class="text-thm" href="#">Wiggle CRC</a></p>
									<ul class="featurej_post">
										<li class="list-inline-item"><span class="flaticon-location-pin"></span> <a href="#">Bothell, WA, USA</a></li>
										<li class="list-inline-item"><span class="flaticon-price pl20"></span> <a href="#">$13.00 - $18.00 per hour</a></li>
									</ul>
								</div>
								<a class="favorit" href="#"><span class="flaticon-favorites"></span></a>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="fj_post style2">
								<div class="details">
									<h5 class="job_chedule text-thm">Part Time</h5>
									<div class="thumb fn-smd">
										<img class="img-fluid" src="images/partners/2.jpg" alt="2.jpg">
									</div>
									<h4>General Ledger Accountant</h4>
									<p>Posted 23 August by <a class="text-thm" href="#">Robert Half Finance & Accounting</a></p>
									<ul class="featurej_post">
										<li class="list-inline-item"><span class="flaticon-location-pin"></span> <a href="#">RG40, Wokingham</a></li>
										<li class="list-inline-item"><span class="flaticon-price pl20"></span> <a href="#">$13.00 - $18.00 per hour</a></li>
									</ul>
								</div>
								<a class="favorit" href="#"><span class="flaticon-favorites"></span></a>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="fj_post style2">
								<div class="details">
									<h5 class="job_chedule text-thm">Full Time</h5>
									<div class="thumb fn-smd">
										<img class="img-fluid" src="images/partners/3.jpg" alt="3.jpg">
									</div>
									<h4>Junior Digital Graphic Designer</h4>
									<p>Posted 23 August by <a class="text-thm" href="#">Parkside Recruitment - Uxbridge Finance</a></p>
									<ul class="featurej_post">
										<li class="list-inline-item"><span class="flaticon-location-pin"></span> <a href="#">New Denham, UB8 1JG</a></li>
										<li class="list-inline-item"><span class="flaticon-price pl20"></span> <a href="#">$13.00 - $18.00 per hour</a></li>
									</ul>
								</div>
								<a class="favorit" href="#"><span class="flaticon-favorites"></span></a>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="fj_post style2">
								<div class="details">
									<h5 class="job_chedule text-thm">Full Time</h5>
									<div class="thumb fn-smd">
										<img class="img-fluid" src="images/partners/4.jpg" alt="4.jpg">
									</div>
									<h4>UX/UI Designer</h4>
									<p>Yesterday <a class="text-thm" href="#">NonStop Recruitment Ltd</a></p>
									<ul class="featurej_post">
										<li class="list-inline-item"><span class="flaticon-location-pin"></span> <a href="#">Bothell, WA, USA</a></li>
										<li class="list-inline-item"><span class="flaticon-price pl20"></span> <a href="#">$13.00 - $18.00 per hour</a></li>
									</ul>
								</div>
								<a class="favorit" href="#"><span class="flaticon-favorites"></span></a>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="fj_post style2">
								<div class="details">
									<h5 class="job_chedule text-thm">Part Time</h5>
									<div class="thumb fn-smd">
										<img class="img-fluid" src="images/partners/10.jpg" alt="10.jpg">
									</div>
									<h4>Junior Digital Graphic Designer</h4>
									<p>Posted 23 August by <a class="text-thm" href="#">Posted 23 August by</a></p>
									<ul class="featurej_post">
										<li class="list-inline-item"><span class="flaticon-location-pin"></span> <a href="#">New Denham, UB8 1JG</a></li>
										<li class="list-inline-item"><span class="flaticon-price pl20"></span> <a href="#">$13.00 - $18.00 per hour</a></li>
									</ul>
								</div>
								<a class="favorit" href="#"><span class="flaticon-favorites"></span></a>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="fj_post style2">
								<div class="details">
									<h5 class="job_chedule text-thm">Part Time</h5>
									<div class="thumb fn-smd">
										<img class="img-fluid" src="images/partners/11.jpg" alt="11.jpg">
									</div>
									<h4>General Ledger Accountant</h4>
									<p>Posted 23 August by <a class="text-thm" href="#">Roevin</a></p>
									<ul class="featurej_post">
										<li class="list-inline-item"><span class="flaticon-location-pin"></span> <a href="#">RG40, Wokingham</a></li>
										<li class="list-inline-item"><span class="flaticon-price pl20"></span> <a href="#">$13.00 - $18.00 per hour</a></li>
									</ul>
								</div>
								<a class="favorit" href="#"><span class="flaticon-favorites"></span></a>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="fj_post style2">
								<div class="details">
									<h5 class="job_chedule text-thm">Part Time</h5>
									<div class="thumb fn-smd">
										<img class="img-fluid" src="images/partners/12.jpg" alt="12.jpg">
									</div>
									<h4>UX/UI Designer</h4>
									<p>UX/UI Designer <a class="text-thm" href="#">Nurseplus</a></p>
									<ul class="featurej_post">
										<li class="list-inline-item"><span class="flaticon-location-pin"></span> <a href="#">Nurseplus</a></li>
										<li class="list-inline-item"><span class="flaticon-price pl20"></span> <a href="#">$13.00 - $18.00 per hour</a></li>
									</ul>
								</div>
								<a class="favorit" href="#"><span class="flaticon-favorites"></span></a>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="mbp_pagination">
								<ul class="page_navigation">
								    <li class="page-item disabled">
								    	<a class="page-link" href="#" tabindex="-1" aria-disabled="true"> <span class="flaticon-left-arrow"></span> Previous</a>
								    </li>
								    <li class="page-item"><a class="page-link" href="#">1</a></li>
								    <li class="page-item active" aria-current="page">
								    	<a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
								    </li>
								    <li class="page-item"><a class="page-link" href="#">3</a></li>
								    <li class="page-item"><a class="page-link" href="#">4</a></li>
								    <li class="page-item"><a class="page-link" href="#">5</a></li>
								    <li class="page-item"><a class="page-link" href="#">...</a></li>
								    <li class="page-item"><a class="page-link" href="#">45</a></li>
								    <li class="page-item">
								    	<a class="page-link" href="#">Next <span class="flaticon-right-arrow"></span></a>
								    </li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</asp:Content>
