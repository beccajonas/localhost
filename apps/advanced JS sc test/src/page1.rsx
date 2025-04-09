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
      id="text2"
      value="window.euResource: **{{  window.euResource}}**"
      verticalAlign="center"
    />
    <JSONExplorer id="jsonExplorer1" value="{{ query1.data}}" />
    <JSONExplorer id="jsonExplorer2" value="{{ query2.data }}" />
  </Frame>
</Screen>
