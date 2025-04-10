<Screen
  id="page1"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title="Page 1"
  urlSlug=""
>
  <RESTQuery
    id="query4"
    resourceDisplayName="Test API"
    resourceName="5a9e58a5-9682-40dd-8b1d-05a0adebc454"
  />
  <RESTQuery
    id="query5"
    resourceDisplayName="Dog API (EU)"
    resourceName="60640093-548a-49fa-a04d-ca1e125552bb"
    resourceNameOverride="{{ window.euResource }}"
    resourceTypeOverride="restapi"
  />
  <RESTQuery
    id="query6"
    resourceDisplayName="Dog API (EU)"
    resourceName="60640093-548a-49fa-a04d-ca1e125552bb"
    resourceNameOverride="{{ window.euResource }}"
    resourceTypeOverride="restapi"
  />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    type="main"
  >
    <Text
      id="text1"
      value="window.usResource: **{{  window.usResource}}**"
      verticalAlign="center"
    />
    <Text
      id="text3"
      value="**Query that was run: ⬇️**"
      verticalAlign="center"
    />
    <JSONExplorer
      id="jsonExplorer1"
      value="{
'query1.resourceNameOverride':
{{ query1.resourceNameOverride }}
}
"
    />
    <Text id="text4" value="{{ query3.data }}" verticalAlign="center" />
  </Frame>
</Screen>
