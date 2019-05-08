<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="OnlineRecruitmentSystem.index" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" runat="server">
    <!-- Home Design -->
    <section class="home-one style3 parallax home_bg3" data-stellar-background-ratio="0.3">
        <div class="container">
            <div class="row home-content">
                <div class="col-lg-8">
                    <div class="home-text">
                        <h2 class="fz40">Find The Job That Fits Your Life</h2>
                        <p class="color-white">Each month, more than 7 million jobseekers turn to website in their search for work, making over 160,000 applications every day.</p>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="home-job-search-box mt20 mb20">
                        <div class="form-inline">
                            <div class="search_option_one">
                                <div class="form-group">
                                    <asp:Label runat="server"><span class="flaticon-search"></span></asp:Label>
                                    <asp:TextBox ID="Key" runat="server" CssClass="form-control h70" Text="Job Title or Keywords"></asp:TextBox>
                                </div>
                            </div>
                            <div class="search_option_two">
                                <div class="form-group">
                                    <asp:Label runat="server"><span class="flaticon-location-pin"></span></asp:Label>
                                    <asp:TextBox ID="Location" runat="server" CssClass="form-control h70" Text="Job Title or Keywords"></asp:TextBox>
                                </div>
                            </div>
                            <div class="search_option_button">
                                <asp:Button ID="Search" runat="server" Text="Search" CssClass="btn btnh3 btn-thm btn-secondary h70" OnClick="Search_Click"/>
                            </div>
                        </div>
                    </div>
                    <p class="color-white">Trending Keywords: DesignCer,  Developer,  Web,  IOS,  PHP,  Senior,  Engineer</p>
                </div>
            </div>
        </div>
    </section>
    <!-- Features Job List Design -->
    <asp:Panel runat="server">
        <section class="popular-job" runat="server">
            <div class="container">

                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="ulockd-main-title">
                            <h3 class="mt0">Featured Jobs</h3>
                        </div>
                    </div>
                </div>
                <asp:ListView ID="ListView1" runat="server">
                    
                </asp:ListView>

                <div class="row">
                <asp:ListView runat="server" ID="JobList" OnItemDataBound="JobList_ItemDataBound" OnItemCommand="JobList_ItemCommand">
                    <ItemTemplate>
                        <div class="col-sm-6 col-lg-12">
                            <div class="fj_post home3">
                                <div class="details">
                                    <div class="thumb fn-smd">
                                        <img class="img-fluid" src="images/partners/2.jpg" alt="2.jpg">
                                    </div>
                                    <h4><%# Eval("JobsName") %></h4>
                                    <p><asp:Label ID="SchoolName" runat="server"></asp:Label>--发布于<%#Eval("ReleaseTime").ToString() %></p>
                                    <ul class="featurej_post">
                                        <li class="list-inline-item"><span class="flaticon-location-pin"></span><a href="#"><asp:Label ID ="City" runat="server"></asp:Label></a></li>
                                        <li class="list-inline-item"><span class="flaticon-price pl20"></span><a href="#"><%#Eval("PayRangeLow").ToString() %>-<%#Eval("PayRangeHigh").ToString() %>RMB</a></li>
                                    </ul>
                                </div>
                                <asp:LinkButton runat="server" CssClass="btn btn-md btn-transparent2 float-right fn-smd" Text="查看" ID="Browse"></asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                    </div>
                <div class="row">
                    <div class="col-lg-6 offset-lg-3">
                        <div class="pjc_all_btn text-center mt15">

                            <a class="btn btn-blue" href="#">Show More Jobs <span class="flaticon-right-arrow pl10"></span></a>
                        </div>
                    </div>
                </div>
                <hr />
            </div>
        </section>
    </asp:Panel>

    <!-- Top Company Registered -->
    <section class="job-location">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="ulockd-main-title mb0">
                        <h3 class="mt0">Top Company Registered</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="company_reg_slider">
                        <div class="item">
                            <div class="company_grid text-center">
                                <div class="thumb">
                                    <img class="img-fluid" src="images/partners/5.jpg" alt="5.jpg">
                                </div>
                                <div class="details">
                                    <h4>The Trainnig</h4>
                                    <p><span class="flaticon-location-pin pr10"></span>Bothell, WA, USA</p>
                                    <a class="btn btn-blue" href="#">4 Open Position</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="company_grid text-center">
                                <div class="thumb">
                                    <img class="img-fluid" src="images/partners/6.jpg" alt="6.jpg">
                                </div>
                                <div class="details">
                                    <h4>Mencap</h4>
                                    <p><span class="flaticon-location-pin pr10"></span>Bothell, WA, USA</p>
                                    <a class="btn btn-blue" href="#">4 Open Position</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="company_grid text-center">
                                <div class="thumb">
                                    <img class="img-fluid" src="images/partners/7.jpg" alt="7.jpg">
                                </div>
                                <div class="details">
                                    <h4>Page Personnel</h4>
                                    <p><span class="flaticon-location-pin pr10"></span>Bothell, WA, USA</p>
                                    <a class="btn btn-blue" href="#">4 Open Position</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="company_grid text-center">
                                <div class="thumb">
                                    <img class="img-fluid" src="images/partners/8.jpg" alt="8.jpg">
                                </div>
                                <div class="details">
                                    <h4>Shiseido</h4>
                                    <p><span class="flaticon-location-pin pr10"></span>Bothell, WA, USA</p>
                                    <a class="btn btn-blue" href="#">4 Open Position</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="company_grid text-center">
                                <div class="thumb">
                                    <img class="img-fluid" src="images/partners/5.jpg" alt="5.jpg">
                                </div>
                                <div class="details">
                                    <h4>The Trainnig</h4>
                                    <p><span class="flaticon-location-pin pr10"></span>Bothell, WA, USA</p>
                                    <a class="btn btn-blue" href="#">4 Open Position</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="company_grid text-center">
                                <div class="thumb">
                                    <img class="img-fluid" src="images/partners/6.jpg" alt="6.jpg">
                                </div>
                                <div class="details">
                                    <h4>Mencap</h4>
                                    <p><span class="flaticon-location-pin pr10"></span>Bothell, WA, USA</p>
                                    <a class="btn btn-blue" href="#">4 Open Position</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="company_grid text-center">
                                <div class="thumb">
                                    <img class="img-fluid" src="images/partners/7.jpg" alt="7.jpg">
                                </div>
                                <div class="details">
                                    <h4>Page Personnel</h4>
                                    <p><span class="flaticon-location-pin pr10"></span>Bothell, WA, USA</p>
                                    <a class="btn btn-blue" href="#">4 Open Position</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="company_grid text-center">
                                <div class="thumb">
                                    <img class="img-fluid" src="images/partners/8.jpg" alt="8.jpg">
                                </div>
                                <div class="details">
                                    <h4>Shiseido</h4>
                                    <p><span class="flaticon-location-pin pr10"></span>Bothell, WA, USA</p>
                                    <a class="btn btn-blue" href="#">4 Open Position</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="company_grid text-center">
                                <div class="thumb">
                                    <img class="img-fluid" src="images/partners/5.jpg" alt="5.jpg">
                                </div>
                                <div class="details">
                                    <h4>The Trainnig</h4>
                                    <p><span class="flaticon-location-pin pr10"></span>Bothell, WA, USA</p>
                                    <a class="btn btn-blue" href="#">4 Open Position</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="company_grid text-center">
                                <div class="thumb">
                                    <img class="img-fluid" src="images/partners/6.jpg" alt="6.jpg">
                                </div>
                                <div class="details">
                                    <h4>Mencap</h4>
                                    <p><span class="flaticon-location-pin pr10"></span>Bothell, WA, USA</p>
                                    <a class="btn btn-blue" href="#">4 Open Position</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="company_grid text-center">
                                <div class="thumb">
                                    <img class="img-fluid" src="images/partners/7.jpg" alt="7.jpg">
                                </div>
                                <div class="details">
                                    <h4>Page Personnel</h4>
                                    <p><span class="flaticon-location-pin pr10"></span>Bothell, WA, USA</p>
                                    <a class="btn btn-blue" href="#">4 Open Position</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="company_grid text-center">
                                <div class="thumb">
                                    <img class="img-fluid" src="images/partners/8.jpg" alt="8.jpg">
                                </div>
                                <div class="details">
                                    <h4>Shiseido</h4>
                                    <p><span class="flaticon-location-pin pr10"></span>Bothell, WA, USA</p>
                                    <a class="btn btn-blue" href="#">4 Open Position</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="company_grid text-center">
                                <div class="thumb">
                                    <img class="img-fluid" src="images/partners/5.jpg" alt="5.jpg">
                                </div>
                                <div class="details">
                                    <h4>The Trainnig</h4>
                                    <p><span class="flaticon-location-pin pr10"></span>Bothell, WA, USA</p>
                                    <a class="btn btn-blue" href="#">4 Open Position</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="company_grid text-center">
                                <div class="thumb">
                                    <img class="img-fluid" src="images/partners/6.jpg" alt="6.jpg">
                                </div>
                                <div class="details">
                                    <h4>Mencap</h4>
                                    <p><span class="flaticon-location-pin pr10"></span>Bothell, WA, USA</p>
                                    <a class="btn btn-blue" href="#">4 Open Position</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="company_grid text-center">
                                <div class="thumb">
                                    <img class="img-fluid" src="images/partners/7.jpg" alt="7.jpg">
                                </div>
                                <div class="details">
                                    <h4>Page Personnel</h4>
                                    <p><span class="flaticon-location-pin pr10"></span>Bothell, WA, USA</p>
                                    <a class="btn btn-blue" href="#">4 Open Position</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="company_grid text-center">
                                <div class="thumb">
                                    <img class="img-fluid" src="images/partners/8.jpg" alt="8.jpg">
                                </div>
                                <div class="details">
                                    <h4>Shiseido</h4>
                                    <p><span class="flaticon-location-pin pr10"></span>Bothell, WA, USA</p>
                                    <a class="btn btn-blue" href="#">4 Open Position</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="company_grid text-center">
                                <div class="thumb">
                                    <img class="img-fluid" src="images/partners/5.jpg" alt="5.jpg">
                                </div>
                                <div class="details">
                                    <h4>The Trainnig</h4>
                                    <p><span class="flaticon-location-pin pr10"></span>Bothell, WA, USA</p>
                                    <a class="btn btn-blue" href="#">4 Open Position</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="company_grid text-center">
                                <div class="thumb">
                                    <img class="img-fluid" src="images/partners/6.jpg" alt="6.jpg">
                                </div>
                                <div class="details">
                                    <h4>Mencap</h4>
                                    <p><span class="flaticon-location-pin pr10"></span>Bothell, WA, USA</p>
                                    <a class="btn btn-blue" href="#">4 Open Position</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="company_grid text-center">
                                <div class="thumb">
                                    <img class="img-fluid" src="images/partners/7.jpg" alt="7.jpg">
                                </div>
                                <div class="details">
                                    <h4>Page Personnel</h4>
                                    <p><span class="flaticon-location-pin pr10"></span>Bothell, WA, USA</p>
                                    <a class="btn btn-blue" href="#">4 Open Position</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="company_grid text-center">
                                <div class="thumb">
                                    <img class="img-fluid" src="images/partners/8.jpg" alt="8.jpg">
                                </div>
                                <div class="details">
                                    <h4>Shiseido</h4>
                                    <p><span class="flaticon-location-pin pr10"></span>Bothell, WA, USA</p>
                                    <a class="btn btn-blue" href="#">4 Open Position</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials -->
    <section class="our-carrer bgc-fa">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="ulockd-main-title">
                        <h3 class="fz25 mt0">What Our Clients Say About Us</h3>
                    </div>
                </div>
                <div class="col-lg-10 offset-lg-1">
                    <div class="testimonial_slider_home3">
                        <div class="item">
                            <div class="testimonial_grid">
                                <div class="t_icon home3"><span class="flaticon-quotation-mark"></span></div>
                                <div class="testimonial_content">
                                    <div class="thumb">
                                        <img class="img-fluid" src="images/testimonial/1.jpg" alt="1.jpg">
                                        <h4>Alex Gibson</h4>
                                        <p>Telemarketer</p>
                                    </div>
                                    <div class="details">
                                        <p>This is the best job-board theme that our company has come across! Without JobHunt i’d be homeless, they found me a job and got me sorted out quickly with everything! Can’t quite…</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimonial_grid">
                                <div class="t_icon home3"><span class="flaticon-quotation-mark"></span></div>
                                <div class="testimonial_content">
                                    <div class="thumb">
                                        <img class="img-fluid" src="images/testimonial/2.jpg" alt="2.jpg">
                                        <h4>Ali TUFAN</h4>
                                        <p>Designer</p>
                                    </div>
                                    <div class="details">
                                        <p>This is the best job-board theme that our company has come across! Without JobHunt i’d be homeless, they found me a job and got me sorted out quickly with everything! Can’t quite…</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimonial_grid">
                                <div class="t_icon home3"><span class="flaticon-quotation-mark"></span></div>
                                <div class="testimonial_content">
                                    <div class="thumb">
                                        <img class="img-fluid" src="images/testimonial/3.jpg" alt="3.jpg">
                                        <h4>Martha Select</h4>
                                        <p>Developer</p>
                                    </div>
                                    <div class="details">
                                        <p>This is the best job-board theme that our company has come across! Without JobHunt i’d be homeless, they found me a job and got me sorted out quickly with everything! Can’t quite…</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimonial_grid">
                                <div class="t_icon home3"><span class="flaticon-quotation-mark"></span></div>
                                <div class="testimonial_content">
                                    <div class="thumb">
                                        <img class="img-fluid" src="images/testimonial/4.jpg" alt="4.jpg">
                                        <h4>Alex Gibson</h4>
                                        <p>Telemarketer</p>
                                    </div>
                                    <div class="details">
                                        <p>This is the best job-board theme that our company has come across! Without JobHunt i’d be homeless, they found me a job and got me sorted out quickly with everything! Can’t quite…</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimonial_grid">
                                <div class="t_icon home3"><span class="flaticon-quotation-mark"></span></div>
                                <div class="testimonial_content">
                                    <div class="thumb">
                                        <img class="img-fluid" src="images/testimonial/2.jpg" alt="5.jpg">
                                        <h4>Ali TUFAN</h4>
                                        <p>Telemarketer</p>
                                    </div>
                                    <div class="details">
                                        <p>This is the best job-board theme that our company has come across! Without JobHunt i’d be homeless, they found me a job and got me sorted out quickly with everything! Can’t quite…</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Our Carrer Tips -->
    <section class="our-carrer">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="ulockd-main-title">
                        <h3 class="fz25 mt0">Quick Career Tips</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="carrer_tips_slider">
                        <div class="item">
                            <a href="#" class="carrer_tips">
                                <div class="ct_header">
                                    <img class="img-fluid" src="images/blog/h31.jpg" alt="h31.jpg">
                                    <div class="ct_date_meta">
                                        <p class="year">2018</p>
                                        <p class="date">April 24</p>
                                    </div>
                                </div>
                                <div class="details">
                                    <h5>Tips</h5>
                                    <h4>Attract More Attention Sales And Profits</h4>
                                    <p>A job ravenously while Far much that one rank beheld after outside ignobly more when oh fussy insect wow.</p>
                                </div>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#" class="carrer_tips">
                                <div class="ct_header">
                                    <img class="img-fluid" src="images/blog/h32.jpg" alt="h32.jpg">
                                    <div class="ct_date_meta">
                                        <p class="year">2018</p>
                                        <p class="date">April 24</p>
                                    </div>
                                </div>
                                <div class="details">
                                    <h5>Tips</h5>
                                    <h4>11 Tips to Help You Get New Clients</h4>
                                    <p>Think back over your life. Think about the people that had a positive influence on Far much that one rank beheld.</p>
                                </div>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#" class="carrer_tips">
                                <div class="ct_header">
                                    <img class="img-fluid" src="images/blog/h33.jpg" alt="h33.jpg">
                                    <div class="ct_date_meta">
                                        <p class="year">2018</p>
                                        <p class="date">April 24</p>
                                    </div>
                                </div>
                                <div class="details">
                                    <h5>Tips</h5>
                                    <h4>An Overworked Newspaper Editor</h4>
                                    <p>Repeatedly dreamed alas opossum but dramatical despite expeditiously that jeepers loosely yikes the as compactly far.</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
