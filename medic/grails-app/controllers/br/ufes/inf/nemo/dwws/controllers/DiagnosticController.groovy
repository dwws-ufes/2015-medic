package br.ufes.inf.nemo.dwws.controllers

import br.ufes.inf.nemo.dwws.domains.Appointment
import br.ufes.inf.nemo.dwws.domains.Diagnostic
import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DiagnosticController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        respond Diagnostic.list(), model:[diagnosticInstanceCount: Diagnostic.count()]
    }

    def show(Diagnostic diagnosticInstance) {
        respond diagnosticInstance
    }

    def create(Appointment appointmentInstance) {

        Diagnostic diagnosticInstace = new Diagnostic(params)
        appointmentInstance.addToDiagnostics(diagnosticInstace)

        respond diagnosticInstace
    }

    @Transactional
    def save(Diagnostic diagnosticInstance) {
        if (diagnosticInstance == null) {
            notFound()
            return
        }

        if (diagnosticInstance.hasErrors()) {
            respond diagnosticInstance.errors, view:'create'
            return
        }

        diagnosticInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'diagnostic.label', default: 'Diagnostic'), diagnosticInstance.id])
                redirect diagnosticInstance
            }
            '*' { respond diagnosticInstance, [status: CREATED] }
        }
    }

    def edit(Diagnostic diagnosticInstance) {
        respond diagnosticInstance
    }

    @Transactional
    def update(Diagnostic diagnosticInstance) {
        if (diagnosticInstance == null) {
            notFound()
            return
        }

        if (diagnosticInstance.hasErrors()) {
            respond diagnosticInstance.errors, view:'edit'
            return
        }

        diagnosticInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Diagnostic.label', default: 'Diagnostic'), diagnosticInstance.id])
                redirect diagnosticInstance
            }
            '*'{ respond diagnosticInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Diagnostic diagnosticInstance) {

        if (diagnosticInstance == null) {
            notFound()
            return
        }

        diagnosticInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Diagnostic.label', default: 'Diagnostic'), diagnosticInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'diagnostic.label', default: 'Diagnostic'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
