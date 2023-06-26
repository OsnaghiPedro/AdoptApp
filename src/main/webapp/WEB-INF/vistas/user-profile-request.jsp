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

                <!-- TAB SOLICITUDES -->
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="solicitudes" role="tabpanel">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h4>Tus Publicaciones</h4>
                                        <hr>
                                        <ul class="nav nav-pills basic-info-items list-inline d-block p-0 m-0">
                                            <c:forEach items="${publicaciones}" var="publicacion">
                                                <li>
                                                    <a class="nav-link mb-2 <c:if test="${selected_pub eq publicacion.publicacion.id}">active</c:if> "
                                                       href="${pageContext.request.contextPath}/perfil/solicitud?pid=${publicacion.publicacion.id}">

                                                        <div class="d-flex align-items-center justify-content-between">
                                                            <div class="d-flex align-items-center">
                                                                <img class="img-fluid rounded-circle avatar-40"
                                                                     src="data:image/jpeg;base64,${publicacion.publicacion.mascota.foto}"
                                                                     alt=""
                                                                     loading="lazy">
                                                                <div class="media-body ms-3">
                                                                    <h6 class="text-dark">
                                                                        <strong>${publicacion.publicacion.mascota.nombre}</strong>
                                                                    </h6>
                                                                    <p class="mb-0"><span
                                                                            class="text-muted">Publicada </span>
                                                                        <span class="link-primary">
                                                                        <script>getTime("${publicacion.publicacion.create_at}")</script>
                                                                        </span>
                                                                    </p>
                                                                </div>

                                                            </div>
                                                            <c:if test="${not empty publicacion.new_messages and publicacion.new_messages > 0}">
                                                                <span class="badge badge-pill bg-light text-dark ml-2"><strong>${publicacion.new_messages}</strong></span>
                                                            </c:if>

                                                        </div>

                                                    </a>
                                                </li>
                                            </c:forEach>

                                            <c:if test="${empty publicaciones}">
                                                <p class="text-muted mt-4 mb-3 text-center">No has publicado nada todavia</p>
                                                <p class="text-center"><a href="${pageContext.request.contextPath}/publicacion/crear">Crear publicaci�n</a></p>
                                            </c:if>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8 ps-4">
                                <div class="card">
                                    <div class="card-body">
                                        <c:if test="${empty selected_pub}">
                                            <div class="d-flex flex-column align-items-center"
                                                 style="margin-top: 40px;">
                                                <img src="${pageContext.request.contextPath}/images/page-img/request.png"
                                                     class="img-fluid w-100 text-center"
                                                     style="opacity: .1; max-width: 100px;" alt="">
                                                <h6 class="text-muted text-center mt-4">Aqu� ver�s las Solicitudes de personas interesadas en tus Publicaciones.</h6>
                                                <h6 class="text-muted text-center mb-5">Selecciona una publicaci�n para
                                                    verlas.</h6>
                                            </div>
                                        </c:if>
                                        <c:if test="${not empty selected_pub}">
                                            <div class="">
                                                <h4>Solicitudes de Adopci�n</h4>
                                                <p class="font-size-12 text-primary">Elije al mejor candidato para tu
                                                    mascota. </p>

                                            </div>

                                            <hr>
                                            <div class="tab-content">
                                                <div class="tab-pane fade show active" id="v-pills-solicitud-p1-tab"
                                                     role="tabpanel"
                                                     aria-labelledby="v-pills-solicitud-p1-tab">


                                                    <ul class="request-list list-inline m-0 p-0">
                                                        <li class="d-flex align-items-center  justify-content-between flex-wrap">
                                                            <a href="" class="d-flex nav-link">
                                                                <div class="user-img img-fluid flex-shrink-0">
                                                                    <img src="${pageContext.request.contextPath}/images/user/05.jpg" alt="story-img"
                                                                         class="rounded-circle avatar-40" loading="lazy">
                                                                </div>
                                                                <div class="flex-grow-1 ms-3">
                                                                    <h6>Jaques Amole</h6>
                                                                    <div class="d-flex">
                                                                        <div class="shadow-none progress  w-100 mt-2 me-2"
                                                                             style="height: 6px">
                                                                            <div class="progress-bar bg-success "
                                                                                 data-toggle="progress-bar"
                                                                                 role="progressbar" aria-valuenow="90"
                                                                                 aria-valuemin="0"
                                                                                 aria-valuemax="100"
                                                                                 style="width: 34%; transition: width 2s ease 0s;">
                                                                            </div>

                                                                        </div>
                                                                        <small class="text-warning">4.5</small>
                                                                    </div>

                                                                </div>
                                                            </a>

                                                            <div class="d-flex align-items-center mt-2 mt-md-0">
                                                                <div class="confirm-click-btn">
                                                                    <a href="#"
                                                                       class="me-3 btn btn-primary rounded confirm-btn">Confirmar</a>

                                                                </div>
                                                                <a href="#" class="btn btn-secondary rounded"
                                                                   data-extra-toggle="delete" data-closest-elem=".item">Rechazar</a>
                                                            </div>
                                                        </li>
                                                        <li class="d-flex align-items-center  justify-content-between flex-wrap">
                                                            <a href="" class="d-flex nav-link">
                                                                <div class="user-img img-fluid flex-shrink-0">
                                                                    <img src="${pageContext.request.contextPath}/images/user/06.jpg" alt="story-img"
                                                                         class="rounded-circle avatar-40" loading="lazy">
                                                                </div>
                                                                <div class="flex-grow-1 ms-3">
                                                                    <h6>Mariel Godoy</h6>
                                                                    <div class="d-flex">
                                                                        <div class="shadow-none progress  w-100 mt-2 me-2"
                                                                             style="height: 6px">
                                                                            <div class="progress-bar bg-success "
                                                                                 data-toggle="progress-bar"
                                                                                 role="progressbar" aria-valuenow="55"
                                                                                 aria-valuemin="0"
                                                                                 aria-valuemax="100"
                                                                                 style="width: 34%; transition: width 2s ease 0s;">
                                                                            </div>

                                                                        </div>
                                                                        <small class="text-warning">3.5</small>
                                                                    </div>

                                                                </div>
                                                            </a>

                                                            <div class="d-flex align-items-center mt-2 mt-md-0">
                                                                <div class="confirm-click-btn">
                                                                    <a href="#"
                                                                       class="me-3 btn btn-primary rounded confirm-btn">Confirmar</a>

                                                                </div>
                                                                <a href="#" class="btn btn-secondary rounded"
                                                                   data-extra-toggle="delete" data-closest-elem=".item">Rechazar</a>
                                                            </div>
                                                        </li>


                                                    </ul>

                                                </div>

                                                <div class="tab-pane fade " id="v-pills-solicitud-p2-tab" role="tabpanel"
                                                     aria-labelledby="v-pills-solicitud-p2-tab">

                                                    <div class="d-flex w-100 justify-content-center">
                                                        <p class="text-muted">A�n no ten�s Solicitudes para esta
                                                            publicaci�n</p>
                                                    </div>


                                                </div>
                                            </div>
                                        </c:if>

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

