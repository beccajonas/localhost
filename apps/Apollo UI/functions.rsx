<GlobalFunctions>
  <State id="apolloApiBaseUrl" value="https://apollo-stg.drata.net/" />
  <RESTQuery
    id="healtcheck"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/healthcheck"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
  />
  <RESTQuery
    id="listRegistry"
    enableTransformer={true}
    headers={'[{"key":"Authorization","value":"BEARER {{  }}"}]'}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/registry"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    transformer="return data.data"
  />
  <RESTQuery
    id="getExternalImages"
    enableTransformer={true}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/image-external"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    transformer="return data.data.map(item => ({...item, key: `${item.name}-${item.variant}` }))"
  />
  <JavascriptQuery
    id="redirectToLogin"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/redirectToLogin.js", "string")}
    resourceName="JavascriptQuery"
    runWhenPageLoads={true}
    showSuccessToaster={false}
  />
  <RESTQuery
    id="auth"
    enableTransformer={true}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/auth/login"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
  />
</GlobalFunctions>
