<Screen
  id="page1"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title="Page 1"
  urlSlug=""
>
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
