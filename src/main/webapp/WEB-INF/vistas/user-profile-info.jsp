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
                <!-- TAB INFO PERSONAL -->
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="informacion" role="tabpanel">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body">
                                        <ul class="nav nav-pills basic-info-items list-inline d-block p-0 m-0">
                                            <li>
                                                <a class="nav-link active" href="#v-pills-basicinfo-tab"
                                                   data-bs-toggle="pill"
                                                   data-bs-target="#v-pills-basicinfo-tab" role="button">Informaci�n
                                                    Personal
                                                </a>
                                            </li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8 ps-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="tab-content">
                                            <div class="tab-pane fade show active" id="v-pills-basicinfo-tab"
                                                 role="tabpanel"
                                                 aria-labelledby="v-pills-basicinfo-tab">
                                                <div class="d-flex align-items-center justify-content-between">
                                                    <h4>Informaci�n Personal</h4>
                                                    <a href="${pageContext.request.contextPath}/perfil/info/editar"
                                                       class="material-symbols-outlined btn btn-primary">
                                                        edit
                                                    </a>
                                                </div>

                                                <hr>
                                                <div class="alert alert-warning d-flex align-items-center" role="alert">
                                                    <i class="fa-solid fa-triangle-exclamation font-size-14 me-2"></i>
                                                    <div>
                                                        Actualiza tu Informaci�n Personal. Te dar� mejor reputaci�n para
                                                        Adoptar.
                                                    </div>
                                                </div>
                                                <div class="row mb-2">
                                                    <div class="col-3">
                                                        <h6>Presentaci�n:</h6>
                                                    </div>
                                                    <div class="col-9">
                                                        <p class="mb-0">${user.presentacion}</p>
                                                    </div>
                                                </div>
                                                <div class="row mb-2">
                                                    <div class="col-3">
                                                        <h6>Nombre y apellido:</h6>
                                                    </div>
                                                    <div class="col-9">
                                                        <p class="mb-0">${user.nombre}</p>
                                                    </div>
                                                </div>
                                                <div class="row mb-2">
                                                    <div class="col-3">
                                                        <h6>Email:</h6>
                                                    </div>
                                                    <div class="col-9">
                                                        <p class="mb-0">${user.email}</p>
                                                    </div>
                                                </div>
                                                <div class="row mb-2">
                                                    <div class="col-3">
                                                        <h6>F. Nac:</h6>
                                                    </div>
                                                    <div class="col-9">
                                                        <p class="mb-0">${user.f_nac}</p>
                                                    </div>
                                                </div>
                                                <div class="row mb-2">
                                                    <div class="col-3">
                                                        <h6>Domicilio:</h6>
                                                    </div>
                                                    <div class="col-9">
                                                        <p class="mb-0">${user.domicilio}</p>
                                                    </div>
                                                </div>
                                                <div class="row mb-2">
                                                    <div class="col-3">
                                                        <h6>Ciudad:</h6>
                                                    </div>
                                                    <div class="col-9">
                                                        <p class="mb-0">${user.ciudad}</p>
                                                    </div>
                                                </div>
                                                <div class="row mb-2">
                                                    <div class="col-3">
                                                        <h6>Provincia:</h6>
                                                    </div>
                                                    <div class="col-9">
                                                        <p class="mb-0">${user.provincia}</p>
                                                    </div>
                                                </div>
                                                <div class="row mb-2">
                                                    <div class="col-3">
                                                        <h6>Tel�fono:</h6>
                                                    </div>
                                                    <div class="col-9">
                                                        <p class="mb-0">${user.tel}</p>
                                                    </div>
                                                </div>

                                                <div class="row mb-2">
                                                    <div class="col-3">
                                                        <h6>Unido el:</h6>
                                                    </div>
                                                    <div class="col-9">
                                                        <p class="mb-0">${user.created_at}</p>
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
</div>


<!-- footer -->

<%@ include file="partials/footer.jsp" %>

<!-- scripts -->

<%@ include file="partials/script.jsp" %>

