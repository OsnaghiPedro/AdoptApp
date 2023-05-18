<!-- head -->

<%@ include file="partials/head.jsp" %>

<!-- navbar -->

<%@ include file="partials/navbar.jsp" %>

<!-- sidebar -->

<%@ include file="partials/sidebar.jsp" %>


<!-- AQUI VA EL CONTENIDO -->
<div id="content-page" class="content-page">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">

                <%@include file="partials/profile-header.jsp"%>

                <%@include file="partials/nav-profile.jsp"%>

            </div>
            <div class="col-sm-12">
                <!-- TAB ACTIVIDAD -->
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="timeline" role="tabpanel">
                        <div class="card-body p-0">
                            <div class="row">
                                <div class="col-lg-4">

                                    <%@include file="partials/calificacion.jsp"%>

                                    <%@include file="partials/nav-profile-activity.jsp"%>

                                </div>
                                <div class="col-lg-8">

                                    <div class="card">

                                        <div class="card-body">
                                            <div class="tab-content">
                                                <!-- MIS PUBLICACIONES -->
                                                <div class="tab-pane fade active show" id="v-pills-misposts-tab"
                                                     role="tabpanel" aria-labelledby="v-pills-misposts-tab">
                                                    <h4>Mis Publicaciones</h4>
                                                    <hr>

                                                    <table class="table forum-table mb-0 rounded">
                                                        <thead class="bg-primary text-white">
                                                        <tr>
                                                            <th>Publicac�on</th>
                                                            <th>Solicitudes</th>
                                                            <th>Preguntas</th>
                                                            <th>Estado</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr>
                                                            <td class="col-lg-5">
                                                                <a href="#">
                                                                    <div class="d-flex align-items-center">
                                                                        <img class="img-fluid rounded-circle avatar-40"
                                                                             src="${pageContext.request.contextPath}/images/posts/4/1.jpg" alt=""
                                                                             loading="lazy">
                                                                        <div class="media-body ms-3">
                                                                            <h6 class="text-dark"><strong>Ninna</strong>
                                                                            </h6>
                                                                            <p class="mb-0"><span class="text-muted">Hace </span>
                                                                                <span class="link-primary"> 3
                                                                        d�as</span>
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                </a>

                                                            </td>
                                                            <td class="col-lg-2 h6 text-center align-items-center">6
                                                            </td>
                                                            <td class="col-lg-2 h6 text-center align-items-center">25
                                                            </td>
                                                            <td class="col-lg-3 ">

                                                         <span
                                                                 class="badge badge-pill bg-success mt-2">DISPONIBLE</span>


                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="col-lg-5">
                                                                <a href="#">
                                                                    <div class="d-flex align-items-center">
                                                                        <img class="img-fluid rounded-circle avatar-40"
                                                                             src="${pageContext.request.contextPath}/images/posts/3/1.avif" alt=""
                                                                             loading="lazy">
                                                                        <div class="media-body ms-3">
                                                                            <h6 class="text-dark">
                                                                                <strong>Chonino</strong></h6>
                                                                            <p class="mb-0"><span class="text-muted">Hace </span>
                                                                                <span class="link-primary"> 2
                                                                        semanas</span>
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </td>
                                                            <td class="col-lg-2 h6 text-center align-items-center">6
                                                            </td>
                                                            <td class="col-lg-2 h6 text-center align-items-center">25
                                                            </td>
                                                            <td class="col-lg-3 ">

                                                                <span class="badge badge-pill bg-warning mt-2">RESERVADO</span>


                                                            </td>
                                                        </tr>


                                                        </tbody>
                                                    </table>

                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>


            </div>

        </div>
    </div>
</div>


<!-- footer -->

<%@ include file="partials/footer.jsp" %>

<!-- scripts -->

<%@ include file="partials/script.jsp" %>

