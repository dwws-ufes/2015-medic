package br.ufes.inf.nemo.dwws.controllers

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import org.codehaus.groovy.grails.web.mapping.LinkGenerator

import br.ufes.inf.nemo.dwws.domains.Appointment;
import br.ufes.inf.nemo.dwws.domains.Diagnostic;
import br.ufes.inf.nemo.dwws.domains.Patient
import br.ufes.inf.nemo.dwws.domains.Prescription;

import com.hp.hpl.jena.datatypes.xsd.XSDDatatype
import com.hp.hpl.jena.datatypes.xsd.XSDDateTime
import com.hp.hpl.jena.rdf.model.Literal
import com.hp.hpl.jena.rdf.model.Model
import com.hp.hpl.jena.rdf.model.ModelFactory
import com.hp.hpl.jena.rdf.model.Property
import com.hp.hpl.jena.rdf.model.Resource
import com.hp.hpl.jena.vocabulary.DCTerms;
import com.hp.hpl.jena.vocabulary.RDF

@Transactional(readOnly = true)
class PatientController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	def LinkGenerator grailsLinkGenerator
	
	def patientService
	
	def index()
	{
		request.withFormat {
            rdf { render patientService.toRDF() }
            '*' { respond Patient.list() }
        }
	}
	
	def rdf(){
		render "Passei RDF ${request.requestURI}"
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
