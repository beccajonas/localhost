<GlobalFunctions>
  <RESTQuery
    id="query1"
    notificationDuration={4.5}
    resourceDisplayName="Dog API (US)"
    resourceName="d8869b7e-fb42-458d-8da8-772ac989bc85"
    resourceNameOverride="{{ current_user.metadata.region === 'US' ? usResource.value : euResource.value }}"
    resourceTypeOverride="restapi"
    showSuccessToaster={false}
  />
  <State id="usResource" value="{{ window.usResource }}" />
  <State id="euResource" value="{{ window.euResource }}" />
</GlobalFunctions>
