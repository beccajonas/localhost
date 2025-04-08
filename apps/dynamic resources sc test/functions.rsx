<GlobalFunctions>
  <RESTQuery
    id="query1"
    resourceDisplayName="Dog API (US)"
    resourceName="d8869b7e-fb42-458d-8da8-772ac989bc85"
    resourceNameOverride="{{ current_user.metadata.region === 'US' ? retoolContext.configVars.US_resource : retoolContext.configVars.EU_resource}}"
    resourceTypeOverride="restapi"
  />
</GlobalFunctions>
