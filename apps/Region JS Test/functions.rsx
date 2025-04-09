<GlobalFunctions>
  <RESTQuery
    id="query1"
    notificationDuration={4.5}
    resourceDisplayName="Dog API (US)"
    resourceName="d8869b7e-fb42-458d-8da8-772ac989bc85"
    resourceNameOverride="{{ current_user.metadata.region === 'US' ? window.usResource : window.euResource }}"
    resourceTypeOverride="restapi"
    showSuccessToaster={false}
  />
  <RESTQuery
    id="query2"
    notificationDuration={4.5}
    resourceDisplayName="Dog API (US)"
    resourceName="d8869b7e-fb42-458d-8da8-772ac989bc85"
    resourceNameOverride="{{ current_user.metadata.region === 'US' ? window.usResource : window.euResource }}"
    resourceTypeOverride="restapi"
    showSuccessToaster={false}
  />
</GlobalFunctions>
