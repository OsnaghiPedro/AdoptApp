function confirm(link){

	console.log("entro");

	console.log(link);
	console.log(link.getAttribute('action'));
	//Warning Message

		Swal.fire({
				title: "Estas seguro?",
				html: '<p>Los Datos se elimina�n de forma permanente y no podr�s recuperarlos.</p>',
				icon: "warning",
				showCancelButton: true,
				cancelButtonText: "Cancelar",
				confirmButtonText: "Si, quiero eliminar!",
				customClass: {
					title: 'h4',
					confirmButton: 'btn btn-primary me-2',
					cancelButton: 'btn btn-secondary',
				},
				buttonsStyling: false
			}).then((result) => {
			if (result.isConfirmed) {
				window.location.href = link.getAttribute('action');
			}
		});





}







