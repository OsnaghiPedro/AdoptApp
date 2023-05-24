<!-- head -->

<%@ include file="partials/head.jsp" %>

<!-- navbar -->

<%@ include file="partials/navbar.jsp" %>

<!-- sidebar -->
<%@ include file="partials/sidebar.jsp" %>

<!-- AQUI VA EL CONTENIDO -->

<div id="content-page" class="content-page ">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">

                <div class="card card-block card-stretch card-height">
                    <div class="card-header d-flex justify-content-start">
                        <div class="header-title">
                            <h4 class="card-title">Nueva Mascota</h4>
                            <p class="link-primary mb-3">Aqu� puedes registrar una nueva Mascota en tu lista.</p>
                        </div>
                    </div>
                    <div class="card-body">
                        <form:form class="row" action="guardar" method="POST"
                                   modelAttribute="mascotaDto" enctype="multipart/form-data">

                            <div class="row align-items-center mb-3">
                                <div class="col-3 ">
                                    <div class="profile-img ms-2">


                                        <img class="avatar-130 img-fluid"
                                             src="${pageContext.request.contextPath}/images/mascota/default.jpg"
                                             id="preview" alt="">
                                        <div class="material-symbols-outlined btn btn-primary btn-profile">
                                            photo_camera
                                            <form:input path="imagen" name="archivoImagen" id="file" type="file"
                                                   class="form-control opacity-0"/>

                                        </div>
                                    </div>

                                </div>

                                <div class="col-9 position-relative">
                                    <label for="nombre" class="form-label"><strong>C�mo se llama la mascota
                                        ?</strong></label>
                                    <form:input path="nombre" type="text" class="form-control" id="nombre" required=""
                                                placeholder="Escribe el nombre..." control-id="ControlID-24"/>
                                    <div class="invalid-tooltip">
                                        Debes poner un nombre.
                                    </div>
                                </div>

                            </div>

                            <h5>Ficha de Mascota</h5>
                            <hr class="mt-0">

                            <div class="row ">
                                <div class="col-md-6 position-relative">
                                    <label for="tipo" class="form-label"><strong>Qu� tipo de mascota
                                        es?</strong></label>
                                    <form:select path="tipo" class="form-select" id="tipo" required="true">
                                        <option selected="" disabled="" value="null">Selecciona un Tipo</option>
                                        <option value="perro">PERRO</option>
                                        <option value="gato">GATO</option>
                                    </form:select>
                                </div>

                                <div class="col-md-6 position-relative">
                                    <label for="genero" class="form-label"><strong>G�nero</strong></label>
                                    <form:select path="genero" class="form-select" id="genero">
                                        <option selected="" disabled="" value="">Selecciona un G�nero</option>
                                        <option value="hembra">HEMBRA</option>
                                        <option value="macho">MACHO</option>
                                    </form:select>

                                </div>

                                <div class="col-md-6 position-relative">
                                    <label for="raza" class="form-label"><strong>Raza</strong></label>
                                    <form:input path="raza" type="text" class="form-control" id="raza" required=""
                                                placeholder="Escribe la raza" control-id="ControlID-24"/>
                                    <div class="invalid-tooltip">
                                        Escribe una Raza.
                                    </div>
                                </div>

                                <div class="col-md-6 position-relative">
                                    <label class="form-label" for="peso"><strong>Cu�nto pesa en
                                        Kg?</strong>
                                        (aporx.)</label>
                                    <form:input path="peso" type="number" class="form-control" id="peso"
                                                value="0.5"
                                                step="0.500" control-id="ControlID-13"/>
                                </div>

                                <div class="col-md-6 position-relative">
                                    <label class="form-label" for=""><strong>Cu�ndo naci�?</strong> (si
                                        no sabes dejalo
                                        vacio)</label>
                                <form:input path="nacimiento" type="date" class="form-control" id="nacimiento"
                                           control-id="ControlID-15"/>
                                </div>
                                <div class="col-md-6 position-relative">
                                    <label for="pers" class="form-label"><strong>Describe su
                                        personalidad</strong></label>
                                    <form:select path="personalidad" class="form-select" id="pers">
                                        <option selected="" disabled="" value="">Selecciona una</option>
                                        <option value="Cari�oso/a">Cari�oso/a</option>
                                        <option value="Amoroso/a">Amoroso/a</option>
                                        <option value="Travieso/a">Travieso/a</option>
                                        <option value="Dormilon/a">Dormilon/a</option>
                                        <option value="Jugueton/a">Jugueton/a</option>
                                        <option value="Momoso/a">Momoso/a</option>
                                    </form:select>

                                </div>
                                <div class="col-md-12 position-relative">
                                    <label for="obs" class="form-label"><strong>Cu�l es su estado de
                                        salud?</strong> (50 caracteres)</label>
                                    <form:input path="salud" type="text" class="form-control" id="obs" required=""
                                                maxlength="50" control-id="ControlID-27"/>
                                    <div class="invalid-tooltip">
                                        Debes completar su estado de salud.
                                    </div>
                                </div>
                            </div>

                            <c:if test="${not empty error}">

                                <div class=" col-md-12 position-relative mt-2 mb-2">
                                    <div class="alert alert-solid alert-danger alert-dismissible fade show d-flex align-items-center gap-2"
                                         role="alert">
                                        <span class="d-flex"><i class="material-symbols-outlined">error</i></span>
                                        <span>${error}</span>
                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert"
                                                aria-label="Close" control-id="ControlID-9"></button>
                                    </div>
                                </div>
                             
                            </c:if>


                            <div class="col-12 text-center mt-3">
                                <a href="new-post.html" class="btn btn-secondary">Cancelar</a>
                                <button class="btn btn-primary" type="submit" control-id="ControlID-30">Guardar</button>
                            </div>
                        </form:form>

                    </div>


                </div>

            </div>

        </div>
    </div>
</div>



<!-- footer -->

<%@ include file="partials/footer.jsp" %>

<script src="${pageContext.request.contextPath}/js/preview.js" type="text/javascript"></script>
<%@ include file="partials/script.jsp" %>

