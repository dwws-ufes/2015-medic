package br.ufes.inf.nemo.dwws.services

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

@Transactional
class PatientService {

	def LinkGenerator grailsLinkGenerator
	
    def toRDF() {
		
		ByteArrayOutputStream os = new ByteArrayOutputStream()
		String baseURL    = "http://localhost:8080/medic/"//"http://localhost:8080/medic/rdf/";
		Model model = ModelFactory.createDefaultModel();
		model.setNsPrefix( "foaf", "http://xmlns.com/foaf/0.1/" );
		model.setNsPrefix( "dbpedia-owl", "http://dbpedia.org/ontology/" );
		model.setNsPrefix( "dcterms", "http://purl.org/dc/terms/")
		model.setNsPrefix( "dbpedia", "http://dbpedia.org/resource/")
		model.setNsPrefix( "xsd", "http://www.w3.org/2001/XMLSchema#")
		model.setNsPrefix( "rdf", "http://www.w3.org/1999/02/22-rdf-syntax-ns#")
		
		Property property
		Literal literal
		
		Patient.list().each { patient ->
			
			//String uri = grailsLinkGenerator.link(controller: 'patient', action: 'show', id: patient.id, absolute: true)//baseURL + patient.name.toLowerCase().replace(" ", "")
			String uri = grailsLinkGenerator.link(absolute: true) + "patient/" + patient.name.toLowerCase().replace(" ", "_")
			Resource patientResource = model.createResource(uri)
			
						
			property = model.createProperty(Patient.rdf['birthDate'])
			Calendar date = Calendar.getInstance();
			date.setTime(patient.birthDate)
			XSDDateTime xsdDate=new XSDDateTime(date);
			literal = model.createTypedLiteral(xsdDate,XSDDatatype.XSDdate);
			patientResource.addProperty(property, literal);

			property = model.createProperty(Patient.rdf['name'])
			literal = model.createTypedLiteral(patient.name);
			patientResource.addProperty(property, literal);
			
			property = model.createProperty(Patient.rdf[''])
			patientResource.addProperty(RDF.type, property);
			
			
			patient.appointments.each { appointment ->
				
				uri = grailsLinkGenerator.link(absolute: true) + "appointment/" + appointment.id
				Resource appointmentResource = model.createResource(uri)
				
				property = model.createProperty(Appointment.rdf['date'])
				date = Calendar.getInstance();
				date.setTime(appointment.date);
				xsdDate=new XSDDateTime(date);
				literal = model.createTypedLiteral(xsdDate,XSDDatatype.XSDdateTime);
				appointmentResource.addProperty(property, literal);
				
				property = model.createProperty(Appointment.rdf[''])
				appointmentResource.addProperty(RDF.type, property);
				
				patientResource.addProperty(DCTerms.subject, appointmentResource)
				
				appointment.diagnostics.each { diagnostic ->
					
					uri = grailsLinkGenerator.link(absolute: true) + "diagnostic/" + diagnostic.id
					//uri = grailsLinkGenerator.link(absolute: true) + "diagnostic/" + diagnostic.disease.toLowerCase().replace(" ", "_")
					Resource diagnosticResource = model.createResource(uri)
					property = model.createProperty(Diagnostic.rdf['disease'])
					literal = model.createTypedLiteral(diagnostic.disease);
					diagnosticResource.addProperty(property, literal);
				
					property = model.createProperty(Diagnostic.rdf[''])
					diagnosticResource.addProperty(RDF.type, property);
				
					appointmentResource.addProperty(DCTerms.subject, diagnosticResource)
				
					diagnostic.prescriptions.each { prescription ->
														
						//uri = grailsLinkGenerator.link(absolute: true) + "prescription/" + prescription.id
						uri = grailsLinkGenerator.link(absolute: true) + "prescription/" + prescription.medicine.toLowerCase().replace(" ", "_")
						Resource prescriptionResource = model.createResource(uri)
						property = model.createProperty(Prescription.rdf['medicine'])
						literal = model.createTypedLiteral(prescription.medicine);
						prescriptionResource.addProperty(property, literal);
				
						property = model.createProperty(Prescription.rdf[''])
						prescriptionResource.addProperty(RDF.type, property);
						
						diagnosticResource.addProperty(DCTerms.subject, prescriptionResource)
					}
					
				}
				
			}
		}
				 
		model.write(os)
		 
		String s = os.toString()
		
		os.close()

		return s

    }
}
