package br.ufes.inf.nemo.dwws.controllers

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import br.ufes.inf.nemo.dwws.domains.Appointment
import br.ufes.inf.nemo.dwws.domains.Diagnostic;
import br.ufes.inf.nemo.dwws.domains.Prescription

@Transactional(readOnly = true)
class PrescriptionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	def prescriptionService
	
    def index()
	{
		respond Prescription.list() 
    }

    def show(Prescription prescriptionInstance) {
        respond prescriptionInstance
    }
	
	def list()
	{
		respond prescriptionService.listDeseases(), [formats:['json']] 
	}

    def create(Diagnostic diagnosticInstance) {

		Prescription prescriptionInstace = new Prescription();
		diagnosticInstance.addToPrescriptions(prescriptionInstace)		
		
        respond prescriptionInstace
    }
	
    @Transactional
    def save(Prescription prescriptionInstance) {
        if (prescriptionInstance == null) {
            notFound()
            return
        }

        if (prescriptionInstance.hasErrors()) {
            respond prescriptionInstance.errors, view:'create'
            return
        }

        prescriptionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'prescription.label', default: 'Prescription'), prescriptionInstance.id])
                redirect prescriptionInstance
            }
            '*' { respond prescriptionInstance, [status: CREATED] }
        }
    }

    def edit(Prescription prescriptionInstance) {
        respond prescriptionInstance
    }

    @Transactional
    def update(Prescription prescriptionInstance) {
        if (prescriptionInstance == null) {
            notFound()
            return
        }

        if (prescriptionInstance.hasErrors()) {
            respond prescriptionInstance.errors, view:'edit'
            return
        }

        prescriptionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Prescription.label', default: 'Prescription'), prescriptionInstance.id])
                redirect prescriptionInstance
            }
            '*'{ respond prescriptionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Prescription prescriptionInstance) {

        if (prescriptionInstance == null) {
            notFound()
            return
        }

        prescriptionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Prescription.label', default: 'Prescription'), prescriptionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'prescription.label', default: 'Prescription'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
