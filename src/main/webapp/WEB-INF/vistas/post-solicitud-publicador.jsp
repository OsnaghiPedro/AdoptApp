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
            <div class="col-sm-12">
                <div class="card bg-primary">
                    <div class="card-body">
                        <div class="">
                            <div class="d-flex align-items-center justify-content-between">
                                <h3 class="text-white">Solicitud de Adopci�n</h3>

                                <c:choose>
                                    <c:when test="${target eq 'perfil-post'}">
                                        <c:set var="redirect" value="${pageContext.request.contextPath}/perfil/actividad/posts"/>
                                    </c:when>
                                    <c:when test="${target eq 'perfil-solicitud'}">
                                        <c:set var="redirect" value="${pageContext.request.contextPath}/perfil/solicitud?pid=${solicitud.publicacion.id}"/>
                                    </c:when>
                                </c:choose>
                                <a class="btn btn-secondary" href="${redirect}">Cerrar</a>
                            </div>
                            <p class="text-white">Aqu� gestionar�s todo el proceso de Adopci�n</p>
                        </div>
                        <div class="card col-lg-5">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <img class="img-fluid rounded-circle avatar-40"
                                         src="data:image/jpg;base64,${solicitud.publicacion.mascota.foto}" alt="" loading="lazy">
                                    <div class="media-body ms-3">
                                        <h6 class="text-dark"><strong>${solicitud.publicacion.mascota.nombre}</strong>
                                        </h6>
                                        <p class="mb-0">
                                            <span class="link-primary"><script>getTime("${solicitud.publicacion.create_at}")</script></span>
                                        </p>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>

                </div>
            </div>
            <div class="col-sm-12 col-lg-12">
                <div class="card">


                    <div class="card-header">
                        <h5>Estado de solicitud</h5>
                    </div>
                    <div class="card-body">
                        <ul class="iq-timeline mx-auto" style="width: 80%">
                            <li>
                                <div class="timeline-dots border-success"></div>
                                <div class="d-flex align-items-center justify-content-between">
                                    <h6 class="fw-bolder mb-1">Solicitud Recibida</h6>
                                    <small><script>getLongTime("${solicitud.created_at}")</script></small>
                                </div>
                                <div class="d-inline-block w-100">
                                    <p><strong>${solicitud.usuario.nombre}</strong> te envi� una solicitud para tu publicaci�n</p>
                                </div>
                            </li>
                            <li>
                                <div class="timeline-dots border-success"></div>
                                <c:if test="${solicitud.estado eq 'PENDIENTE'}">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <h6 class="fw-bolder mb-1">Pendiente de Aceptaci�n</h6>
                                        <a class="btn btn-primary" onclick="confirmAceptar(this)" action="${pageContext.request.contextPath}/solicitud/aceptar?code=${solicitud.codigo}&target=solicitud" href="javascript:void(0);">
                                            Aceptar Solicitud
                                        </a>
                                    </div>
                                    <div class="d-inline-block w-100">
                                        <p>Al aceptar la Solicitud iniciar� el proceso de Adopci�n</p>
                                    </div>
                                </c:if>
                                <c:if test="${solicitud.estado eq 'ACEPTADA'}">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <h6 class="fw-bolder mb-1">Aceptaste la Solicitud</h6>
                                        <c:if test="${solicitud.publicacion.estado eq 'RESERVADO'}">
                                        <small><script>getLongTime("${solicitud.update_at}")</script></small>
                                        </c:if>
                                    </div>
                                    <div class="d-inline-block w-100">
                                        <p>Le informaremos al Adoptante para que retire la mascota</p>
                                    </div>
                                </c:if>
                                <c:if test="${(solicitud.estado eq 'CANCELADA') || (solicitud.estado eq 'CERRADA') }">
                                    <div class="timeline-dots border-success"></div>
                                    <div class="d-flex align-items-center justify-content-between">
                                        <h6 class="fw-bolder mb-1">Aceptaste la Solicitud</h6>
                                    </div>
                                    <div class="d-inline-block w-100">
                                        <p>El adoptante ya fu� informado y retirar� la Mascota.</p>
                                    </div>
                                </c:if>

                            </li>
                            <li>
                                <c:if test="${solicitud.estado eq 'PENDIENTE'}">
                                    <div class="timeline-dots border-light"></div>
                                    <div class="d-flex align-items-center justify-content-between">
                                        <h6 class="text-muted mb-1">Pendiente de entrega</h6>

                                    </div>
                                </c:if>
                                <c:if test="${solicitud.estado eq 'ACEPTADA'}">
                                    <div class="timeline-dots border-success"></div>

                                        <c:if test="${solicitud.publicacion.estado eq 'RESERVADO'}">
                                             <div class="d-flex align-items-center justify-content-between">
                                                  <h6 class="fw-bolder mb-1">Pendiente de entrega</h6>
                                             </div>
                                            <p>Cuando el Adoptante Retire la mascota deberas informar la entrega.</p>
                                        </c:if>
                                        <c:if test="${solicitud.publicacion.estado eq 'CERRADA'}">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <h6 class="fw-bolder mb-1">Entregada</h6>
                                            </div>
                                            <p>El adoptante ya retiro la mascota</p>
                                        </c:if>

                                </c:if>
                                <c:if test="${solicitud.estado eq 'CANCELADA'}">
                                    <div class="timeline-dots border-danger"></div>

                                    <div class="d-flex align-items-center justify-content-between">
                                        <h6 class="fw-bolder text-danger mb-1">El Adoptante Cancel� el proceso</h6>
                                        <small><script>getLongTime("${solicitud.update_at}")</script></small>

                                    </div>
                                    <p>Te mostramos los motivos que inform�.</p>

                                </c:if>
                                <c:if test="${solicitud.estado eq 'CERRADA'}">
                                    <div class="timeline-dots border-danger"></div>
                                    <div class="d-flex align-items-center justify-content-between">
                                        <h6 class="fw-bolder text-danger mb-1">Proceso de Adopc�n fu� Cerrado</h6>
                                        <small><script>getLongTime("${solicitud.update_at}")</script></small>
                                    </div>
                                    <p>Finaliz� el Proceso debido que el Adoptante ha cancelado la Adopci�n.</p>

                                </c:if>


                            </li>
                            <li>
                                <c:if test="${(solicitud.estado eq 'PENDIENTE') || ((solicitud.estado eq 'ACEPTADA') && (solicitud.publicacion.estado eq 'RESERVADO'))}">
                                    <div class="timeline-dots border-light"></div>
                                    <div class="d-flex align-items-center justify-content-between">
                                        <h6 class="text-muted mb-1">Mascota adoptada</h6>

                                    </div>
                                </c:if>
                                <c:if test="${(solicitud.estado eq 'ACEPTADA') && (solicitud.publicacion.estado eq 'CERRADA')}">
                                    <div class="timeline-dots border-success"></div>
                                    <div class="d-flex align-items-center justify-content-between">
                                        <h6 class="fw-bolder mb-1">Mascota adoptada</h6>
                                        <small><script>getLongTime("${solicitud.update_at}")</script></small>
                                    </div>

                                </c:if>
                                <c:if test="${(solicitud.estado eq 'CANCELADA') || (solicitud.estado eq 'CERRADA')}">
                                    <div class="timeline-dots border-light"></div>
                                    <div class="d-flex align-items-center justify-content-between">
                                        <h6 class="text-muted mb-1">Mascota adoptada</h6>
                                    </div>
                                </c:if>

                            </li>

                        </ul>
                    </div>


                </div>

                <c:if test="${(solicitud.estado eq 'CANCELADA')}">
                    <div class="card">

                        <div class="card-header bg-soft-danger">
                            <h5 style="color: #3e3e3e;"><strong>${solicitud.usuario.nombre}</strong> ha Cancelado el proceso de Adopc�on</h5>
                        </div>
                        <div class="card-body">

                                <p>El Adoptante inform� lo siguiente:</p>
                                <div class="p-2 mt-2 bg-soft-light rounded">
                                    <p class="text-dark ms-3">${solicitud.motivo_cancelacion}</p>
                                </div>

                            <div class="mt-3">
                                <p class="text-muted">Al Cerrar el Proceso, la Publicaci�n se Reanudar� y estar� disponible para que otros usuarios puedan verla y enviarte solicitudes de Adopc�on.</p>
                                <a class="btn btn-primary mt-2" onclick="confirmCerrar(this)" action="${pageContext.request.contextPath}/solicitud/cerrar?code=${solicitud.codigo}&target=${target}" href="javascript:void(0);">Cerrar Proceso y Calificar</a>

                            </div>




                        </div>

                    </div>
                </c:if>


                    <c:if test="${(solicitud.estado eq 'ACEPTADA') && (solicitud.publicacion.estado eq 'RESERVADO')}">
                        <div class="card">

                            <div class="card-header bg-soft-warning">
                                <h5 style="color: #3e3e3e;"><strong>${solicitud.usuario.nombre}</strong> est� en camino</h5>
                            </div>
                            <div class="card-body">
                               <div class="d-flex justify-content-between">
                                   <p>El Adoptante retirar� a <strong>${solicitud.publicacion.mascota.nombre}</strong> en la direcci�n que aportaste.</p>
                                   <a class="btn btn-primary" onclick="confirmEntrega(this)" action="${pageContext.request.contextPath}/solicitud/entregar?code=${solicitud.codigo}&target=${target}" href="javascript:void(0);">Ya Entregu� la Mascota</a>
                               </div>



                            </div>
                            <div class="card-footer">
                                <h5>Contacta al Adoptante</h5>
                                <hr>
                                <div class="item4 ms-1">
                                    <div class="d-flex justify-content-between">

                                        <div class="me-3">
                                            <img class="rounded-circle img-fluid"
                                                 src="data:image/jpeg;base64,${solicitud.usuario.imagen}" style="max-width: 40px;" alt="" loading="lazy">
                                        </div>


                                        <div class="w-100">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="">
                                                    <h6 class="mb-0 d-inline-block">${solicitud.usuario.nombre}</h6>
                                                </div>
                                                <button type="button" class="btn btn-primary"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#chat-solicitud">
                                                    ver mensajes
                                                </button>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${(solicitud.estado eq 'ACEPTADA') && (solicitud.publicacion.estado eq 'CERRADA') && (solicitud.calP eq false)}">
                        <div class="card">

                            <div class="card-header bg-soft-success">
                                <h5 style="color: #3e3e3e;">Felicitaciones!!, <strong>${solicitud.publicacion.mascota.nombre}</strong> ya est� en su nueva casa.
                                </h5>
                            </div>
                            <div class="card-body">
                                <h6>Contanos tu experiencia con <strong>${solicitud.usuario.nombre}</strong></h6>
                                <div class="mt-3">
                                    <form:form action="${pageContext.request.contextPath}/solicitud/calificarAdoptante?id=${solicitud.usuario.id}&code=${solicitud.codigo}&target=${target}" method="post" modelAttribute="calificacion">
                                    <p class="ms-4"><strong>Que calificaci�n le das?</strong><span class="text-muted"> (de 0 a 5 estrellas)</span>
                                    </p>
                                    <div class="rating-stars block" id="rating-1" data-stars="0" style="cursor: pointer;">
                                    </div>
                                    <p class="ms-4 mt-3"><strong>Opin� sobre el Adoptante</strong><span class="text-muted"> (m�ximo 255 caracteres)</span>
                                    </p>
                                    <div class="px-4 d-flex flex-column justify-content-center">
                                        <form:textarea path="commentario" class="form-control" maxlength="255" rows="3" required="true"></form:textarea>
                                        <div class="d-flex justify-content-between align-items-center px-5">
                                            <a  class="btn btn-secondary mt-3 mx-5" href="${redirect}" style="width: 50%">Calificar mas tarde..
                                            </a>
                                            <button type="submit" class="btn btn-primary mt-3 mx-5" style="width: 50%">Enviar
                                                Calificaci�n
                                            </button>
                                        </div>

                                    </div>
                                        <form:input path="calificacion" id="cal" type="hidden"/>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </c:if>
                <c:if test="${(solicitud.estado eq 'CERRADA')  && (solicitud.calP eq false)}">
                    <div class="card">

                        <div class="card-header bg-soft-success">
                            <h5 style="color: #3e3e3e;">El Proceso se Cerr�, puedes calificar tu experiencia con <strong>${solicitud.usuario.nombre}</strong>
                            </h5>
                        </div>
                        <div class="card-body">
                            <h6>Contanos tu experiencia con <strong>${solicitud.usuario.nombre}</strong></h6>
                            <div class="mt-3">
                                <form:form action="${pageContext.request.contextPath}/solicitud/calificarAdoptante?id=${solicitud.usuario.id}&code=${solicitud.codigo}&target=${target}" method="post" modelAttribute="calificacion">
                                    <p class="ms-4"><strong>Que calificaci�n le das?</strong><span class="text-muted"> (de 0 a 5 estrellas)</span>
                                    </p>
                                    <div class="rating-stars block" id="rating-1" data-stars="0" style="cursor: pointer;">
                                    </div>
                                    <p class="ms-4 mt-3"><strong>Opin� sobre el Adoptante</strong><span class="text-muted"> (m�ximo 255 caracteres)</span>
                                    </p>
                                    <div class="px-4 d-flex flex-column justify-content-center">
                                        <form:textarea path="commentario" class="form-control" maxlength="255" rows="3" required="true"></form:textarea>
                                        <div class="d-flex justify-content-between align-items-center px-5">
                                            <a  class="btn btn-secondary mt-3 mx-5" href="${redirect}" style="width: 50%">Calificar mas tarde..
                                            </a>
                                            <button type="submit" class="btn btn-primary mt-3 mx-5" style="width: 50%">Enviar
                                                Calificaci�n
                                            </button>
                                        </div>

                                    </div>
                                    <form:input path="calificacion" id="cal" type="hidden"/>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </c:if>

                <c:if test="${(solicitud.estado eq 'CERRADA')  && (solicitud.calP eq true)}">
                    <div class="card bg-soft-danger">
                        <div class="card-body">
                            <p class="text-center mt-3">Este proceso se Cerr� con fecha <strong><script>getLongTime('${solicitud.update_at}')</script></strong></p>
                        </div>
                    </div>
                </c:if>

                <c:if test="${(solicitud.estado eq 'ACEPTADA') && (solicitud.publicacion.estado eq 'CERRADA') && (solicitud.calP eq true)}">
                    <div class="card">
                        <div class="card-body">
                            <p class="text-center mt-3">La publicaci�n se Cerr� con fecha <strong><script>getLongTime('${solicitud.update_at}')</script></strong></p>
                        </div>
                    </div>
                </c:if>







                <div class="card">

                    <div class="card-header">
                        <h5>Necesitas ayuda?</h5>
                    </div>
                    <div class="card-body">
                        <ul>
                            <c:if test="${solicitud.publicacion.estado eq 'RESERVADO' && solicitud.estado eq 'ACEPTADA'}">
                                <li>
                                    <a class="btn btn-action text-dark" href="">El adoptante nunca retir� la mascota</a>
                                </li>
                            </c:if>
                            <li>
                                <a class="btn btn-action text-dark" href="#">Preguntas frecuentes</a>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>


        </div>

    </div>

    <!-- chat-->

    <%@ include file="partials/chat-solicitud.jsp" %>


    <!-- footer -->

    <%@ include file="partials/footer.jsp" %>

    <!-- scripts -->

    <%@ include file="partials/script.jsp" %>


    <script
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBeluO_jCvIS_iT6Y3Thw8A6YJW5gyzh0M&callback=initAutocomplete&libraries=places&v=weekly"
            defer>
    </script>
    <script src="${pageContext.request.contextPath}/js/multifile.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/google.maps.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/rating/jquery-rate-picker.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/rating/rating-picker.js" type="text/javascript"></script>

    <!-- fslightbox Script -->
    <script src="${pageContext.request.contextPath}/js/fslightbox.js" defer></script>

    <!--- Internal Sweet-Alert js -->
    <script src="${pageContext.request.contextPath}/js/plugins/sweet-alert/sweetalert.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/sweet-alert/jquery.sweet-alert.js"></script>
