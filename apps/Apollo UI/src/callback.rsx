<Screen
  id="callback"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  title="callback"
  urlSlug="callback"
>
  <JavascriptQuery
    id="saveToken"
    notificationDuration={4.5}
    query={include("../lib/saveToken.js", "string")}
    resourceName="JavascriptQuery"
    runWhenPageLoads={true}
    showSuccessToaster={false}
  />
  <Frame
    id="$main12"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  />
</Screen>
