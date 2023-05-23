<!-- head -->

<%@ include file="partials/head.jsp" %>

<!-- navbar -->

<%@ include file="partials/navbar.jsp" %>

<!-- sidebar -->

<%@ include file="partials/sidebar.jsp" %>


<div id="content-page" class="content-page">

    <!-- contenido -->
    <div class="container">
        <div class="row">
            <div class="col-lg-8 row m-0 p-0">
                <div class="col-sm-12">
                    <div id="post-modal-data" class="card card-block card-stretch card-height">

                        <%@include file="partials/nav-home.jsp" %>

                    </div>
                </div>


                <div class="col-sm-12">


                    <div class="tab-content">


                        <!-- FAVORITOS TAB -->

                        <div class="tab-pane fade show active " id="favoritos" role="tabpanel">
                            <div class="card">
                                <div class="card-body">

                                    <div class="card-header d-flex justify-content-between px-0">
                                        <div class="header-title">
                                            <h4 class="card-title">Tus Favoritos (2)</h4>
                                        </div>
                                    </div>
                                    <div class="card-body p-0 pt-3">
                                        <ul class="request-list list-inline m-0 p-0">
                                            <li class="d-flex align-items-center  justify-content-between flex-wrap">
                                                <div class="user-img img-fluid flex-shrink-0">
                                                    <img src="${pageContext.request.contextPath}/images/posts/1/1.jpg"
                                                         alt="story-img"
                                                         class="rounded-circle avatar-40" loading="lazy">
                                                </div>
                                                <div class="flex-grow-1 ms-3">
                                                    <h6><strong>Tobby </strong> <small class="text-muted">de <a
                                                            href="#">Maria
                                                        Gutierrez</a></small></h6>
                                                    <p class="mb-0">6 Interesados</p>
                                                </div>
                                                <div class="d-flex align-items-center mt-2 mt-md-0">
                                                    <div class="confirm-click-btn">
                                                        <a href="#"
                                                           class="me-3 btn btn-primary rounded confirm-btn">Ver</a>
                                                        <a href="../app/profile.html"
                                                           class="me-3 btn btn-primary rounded request-btn"
                                                           style="display: none;">View All</a>
                                                    </div>
                                                    <a href="#" class="btn btn-secondary rounded"><i
                                                            class="fa-solid fa-trash-can"></i></a>
                                                </div>
                                            </li>
                                            <li class="d-flex align-items-center  justify-content-between flex-wrap">
                                                <div class="user-img img-fluid flex-shrink-0">
                                                    <img src="${pageContext.request.contextPath}/images/posts/2/1.webp"
                                                         alt="story-img"
                                                         class="rounded-circle avatar-40" loading="lazy">
                                                </div>
                                                <div class="flex-grow-1 ms-3">
                                                    <h6><strong>Olimpia </strong> <small class="text-muted">de <a
                                                            href="#">Gast�n Barrientos</a></small></h6>
                                                    <p class="mb-0">35 Interesados</p>
                                                </div>
                                                <div class="d-flex align-items-center mt-2 mt-md-0">
                                                    <div class="confirm-click-btn">
                                                        <a href="#"
                                                           class="me-3 btn btn-primary rounded confirm-btn">Ver</a>
                                                        <a href="../app/profile.html"
                                                           class="me-3 btn btn-primary rounded request-btn"
                                                           style="display: none;">View All</a>
                                                    </div>
                                                    <a href="#" class="btn btn-secondary rounded"><i
                                                            class="fa-solid fa-trash-can"></i></a>
                                                </div>
                                            </li>

                                        </ul>
                                    </div>


                                </div>
                            </div>
                        </div>


                    </div>


                </div>


            </div>
            <!--ACCESOS RAPIDOS -->
            <%@include file="partials/tools-home.jsp" %>

        </div>


    </div>

</div>
<!-- footer -->

<%@ include file="partials/footer.jsp" %>

<!-- scripts -->

<%@ include file="partials/script.jsp" %>
