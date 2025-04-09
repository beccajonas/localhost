<GlobalFunctions>
  <RESTQuery
    id="query1"
    resourceDisplayName="Dog API (US)"
    resourceName="d8869b7e-fb42-458d-8da8-772ac989bc85"
    resourceNameOverride="{{ current_user.metadata.region === 'US' ? window.usResource : window.euResource }}"
    resourceTypeOverride="restapi"
  >
    <Event
      event="success"
      method="trigger"
      params={{}}
      pluginId="query3"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <JavascriptQuery
    id="query3"
    notificationDuration={4.5}
    query={include("./lib/query3.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
</GlobalFunctions>
