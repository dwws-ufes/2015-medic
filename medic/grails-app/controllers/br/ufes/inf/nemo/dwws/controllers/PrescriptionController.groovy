package br.ufes.inf.nemo.dwws.controllers

import br.ufes.inf.nemo.dwws.domains.Prescription

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PrescriptionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        //params.max = Math.min(max ?: 10, 100)
        respond Prescription.list(), model:[prescriptionInstanceCount: Prescription.count()]
    }

    def show(Prescription prescriptionInstance) {
        respond prescriptionInstance
    }

    def create() {
        respond new Prescription(params)
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
