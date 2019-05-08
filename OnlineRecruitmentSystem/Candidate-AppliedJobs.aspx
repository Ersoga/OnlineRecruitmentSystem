<%@ Page Title="" Language="C#" MasterPageFile="~/Site_fix.Master" AutoEventWireup="true" CodeBehind="Candidate-AppliedJobs.aspx.cs" Inherits="OnlineRecruitmentSystem.Candidate_AppliedJobs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" runat="server">
    <div class="col-lg-8 col-xl-9">
        <div class="row">
            <div class="col-lg-12">
                <h4 class="fz18 mb30">Applied Jobs</h4>
            </div>
        </div>
        <div class="row applyed_job">
            <asp:DataList ID="AppliedJobsList" runat="server">
                <ItemTemplate>
                    <div class="col-sm-12 col-lg-12">
                        <div class="fj_post">
                            <div class="details">
                                <div class="thumb fn-smd">
                                    <img class="img-fluid" src="images/partners/1.jpg" alt="1.jpg">
                                </div>
                                <h4><%#Eval("JobsName") %></h4>
                                投递于<asp:Label ID="Label1" runat="server" Text=''><%#Eval("DeliveryTime").ToString() %></asp:Label>
                                <%--<p>Posted 23 August by <a class="text-thm" href="#">Wiggle CRC</a></p>--%>
                                <ul class="featurej_post">
                                    <li class="list-inline-item"><span class="flaticon-location-pin"></span><a href="#">Bothell, WA, USA</a></li>
                                    <li class="list-inline-item"><span class="flaticon-price pl20"></span><a href="#">$13.00 - $18.00 per hour</a></li>
                                </ul>
                            </div>
                            <ul class="view_edit_delete_list float-right">
                                <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Edit"><span class="flaticon-edit"></span></a></li>
                                <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Delete"><span class="flaticon-rubbish-bin"></span></a></li>
                            </ul>
                        </div>
                    </div>
                </ItemTemplate>
                <SelectedItemTemplate>

                </SelectedItemTemplate>
            </asp:DataList>
						
						<div class="col-sm-12 col-lg-12">
							<div class="fj_post">
								<div class="details">
									<h5 class="job_chedule text-thm mt0">Part Time</h5>
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
				    			<ul class="view_edit_delete_list float-right">
				    				<li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Edit"><span class="flaticon-edit"></span></a></li>
				    				<li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Delete"><span class="flaticon-rubbish-bin"></span></a></li>
				    			</ul>
							</div>
						</div>
						<div class="col-sm-12 col-lg-12">
							<div class="fj_post">
								<div class="details">
									<h5 class="job_chedule text-thm mt0">Full Time</h5>
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
				    			<ul class="view_edit_delete_list float-right">
				    				<li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Edit"><span class="flaticon-edit"></span></a></li>
				    				<li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Delete"><span class="flaticon-rubbish-bin"></span></a></li>
				    			</ul>
							</div>
						</div>
						<div class="col-sm-12 col-lg-12">
							<div class="fj_post">
								<div class="details">
									<h5 class="job_chedule text-thm mt0">Full Time</h5>
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
				    			<ul class="view_edit_delete_list float-right">
				    				<li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Edit"><span class="flaticon-edit"></span></a></li>
				    				<li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Delete"><span class="flaticon-rubbish-bin"></span></a></li>
				    			</ul>
							</div>
						</div>
					</div>
				</div>
</asp:Content>
