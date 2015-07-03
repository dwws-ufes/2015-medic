package br.ufes.inf.nemo.dwws.controllers

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import br.ufes.inf.nemo.dwws.domains.Patient

@Transactional(readOnly = true)
class PatientController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		//params.max = Math.min(max ?: 10, 100)
		respond Patient.list(), model:[patientInstanceCount: Patient.count()]
	}

    def create() {
        respond new Patient(params)
    }

    def edit(Patient patientInstance) {
        respond patientInstance
    }
	
/*	def list()
	{
		respond Patient.list(), [formats:['json', 'xml']]
	}*/


    def show(Patient patientInstance) {
        respond patientInstance
    }

    @Transactional
    def save(Patient patientInstance) {
        if (patientInstance == null) {
            notFound()
            return
        }

        if (patientInstance.hasErrors()) {
            respond patientInstance.errors, view:'create'
            return
        }

        patientInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'patient.label', default: 'Patient'), patientInstance.id])
                redirect patientInstance
            }
            '*' { respond patientInstance, [status: CREATED] }
        }
    }

    @Transactional
    def update(Patient patientInstance) {
        if (patientInstance == null) {
            notFound()
            return
        }

        if (patientInstance.hasErrors()) {
            respond patientInstance.errors, view:'edit'
            return
        }

        patientInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Patient.label', default: 'Patient'), patientInstance.id])
                redirect patientInstance
            }
            '*'{ respond patientInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Patient patientInstance) {

        if (patientInstance == null) {
            notFound()
            return
        }

        patientInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Patient.label', default: 'Patient'), patientInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'patient.label', default: 'Patient'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
