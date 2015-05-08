<%@ page import="br.ufes.inf.nemo.dwws.domains.Diagnostic" %>


<div class="form-group">
    <label for="disease" class="col-lg-5 control-label">
        <g:message code="diagnostic.disease.label" default="Disease" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-lg-7">
        <g:textField name="disease" maxlength="40" required="" value="${diagnosticInstance?.disease}"/>
    </div>
</div>

<div class="fieldcontain ${hasErrors(bean: diagnosticInstance, field: 'appointment', 'error')} required" hidden="">
    <label for="appointment">
        <g:message code="diagnostic.appointment.label" default="Appointment" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="appointment" name="appointment.id" from="${br.ufes.inf.nemo.dwws.domains.Appointment.list()}" optionKey="id" required="" value="${diagnosticInstance?.appointment?.id}" class="many-to-one"/>

</div>