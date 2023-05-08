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

                        <form:form class="row needs-validation" action="" id="form"  method="POST" modelAttribute="" enctype="multipart/form-data" novalidate="" >
                           <div class="row align-items-center mb-3">
                              <div class="col-3 ">
                                 <div class="profile-img ms-2">


                                    <img class="avatar-130 img-fluid" src="images/mascota/profiles/default.webp"
                                       id="preview" alt="">
                                    <div class="material-symbols-outlined btn btn-primary btn-profile">
                                       photo_camera
                                       <form:input path="imagen" name="archivoImagen" id="file" type="file"
                                          class="form-control opacity-0" />

                                    </div>
                                 </div>

                              </div>

                              <div class="col-9 position-relative">
                                 <label for="nombre" class="form-label"><strong>C�mo se llama la mascota
                                       ?</strong></label>
                                 <form:input path="" type="text" class="form-control" id="nombre" required=""
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
                                 <label for="validationTooltip04" class="form-label"><strong>Qu� tipo de mascota
                                       es?</strong></label>
                                 <form:select path="" class="form-select" id="validationTooltip04" required=""
                                    control-id="ControlID-28">
                                    <form:option selected="" disabled="" value="0">Selecciona un tipo</form:option>
                                    <form:option value="1">PERRO</form:option>
                                    <form:option value="2">GATO</form:option>
                                 </form:select>
                                 <div class="invalid-tooltip">
                                    Selecciona un tipo.
                                 </div>
                              </div>
                              <div class="col-md-6 position-relative">
                                 <label for="validationTooltip04" class="form-label"><strong>G�nero</strong></label>
                                 <form:select path="" class="form-select" id="validationTooltip04" required=""
                                    control-id="ControlID-28">
                                    <form:option selected="" disabled="" value="0">Selecciona un G�nero</form:option>
                                    <form:option value="1">HEMBRA</form:option>
                                    <form:option value="2">MACHO</form:option>
                                 </form:select>
                                 <div class="invalid-tooltip">
                                    Selecciona un g�nero.
                                 </div>
                              </div>
                              <div class="col-md-6 position-relative">
                                 <label for="validationTooltip02" class="form-label"><strong>Raza</strong></label>
                                 <form:input path="" type="text" class="form-control" id="validationTooltip02"
                                    placeholder="Que raza es?" required="" control-id="ControlID-25"/>
                                 <div class="invalid-tooltip">
                                    Selecciona una Raza.
                                 </div>
                              </div>
                              <div class="col-md-6 position-relative">
                                 <label class="form-label" for="exampleInputNumber1"><strong>Cuanto pesa en
                                       Kg?</strong>
                                    (aporx.)</label>
                                 <form:input path="" type="number" class="form-control" id="exampleInputNumber1" value="0.5"
                                    step="0.500" control-id="ControlID-13"/>
                              </div>
                              <div class="col-md-6 position-relative">
                                 <label class="form-label" for="exampleInputdate"><strong>C�ando naci�?</strong> (si
                                    no s�bes dejalo
                                    vacio)</label>
                                 <form:input path="" type="date" class="form-control" id="exampleInputdate" value="Now"
                                    control-id="ControlID-15">
                              </div>
                              <div class="col-md-6 position-relative">
                                 <label for="validationTooltip04" class="form-label"><strong>Descr�be su
                                       personalidad</strong></label>
                                 <form:select path="" class="form-select" id="validationTooltip04" required=""
                                    control-id="ControlID-28">
                                    <form:option selected="" disabled="" value="0">Selecciona una</form:option>
                                    <form:option value="">Cari�oso/a</form:option>
                                    <form:option value="">Amoroso/a</form:option>
                                    <form:option value="">Jugueton/a</form:option>
                                    <form:option value="">Travieso/a</form:option>
                                    <form:option value="">Dormilon/a</form:option>
                                    <form:option value="">Momoso/a</form:option>
                                 </form:select>
                                 <div class="invalid-tooltip">
                                    Selecciona una personalidad.
                                 </div>
                              </div>
                              <div class="col-md-12 position-relative">
                                 <label for="validationTooltip03" class="form-label"><strong>Cual es su estado de
                                       salud?</strong> (50 caracteres)</label>
                                 <form:input path="" type="text" class="form-control" id="validationTooltip03" required=""
                                    maxlength="50" control-id="ControlID-27"/>
                                 <div class="invalid-tooltip">
                                    Debes completar su estado de salud.
                                 </div>
                              </div>
                              <div class=" col-md-12 position-relative mt-2 mb-2">
                                 <div class="alert alert-solid alert-danger alert-dismissible fade show d-flex align-items-center gap-2" role="alert">
                                     <span class="d-flex"><i class="material-symbols-outlined">error</i></span>
                                     <span> Ups! aqui va un mensaje de error</span>
                                     <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close" control-id="ControlID-9"></button>
                                  </div>
                             </div>
                           </div>


                          
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

<script src="vendor/dropzone/dropzone-min.js"></script>

<script src="js/form-file-upload.init.js"></script>


<!-- footer -->

<%@ include file="partials/footer.jsp" %>

<!-- scripts -->

<%@ include file="partials/script.jsp" %>





