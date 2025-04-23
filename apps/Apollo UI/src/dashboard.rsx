<Screen
  id="dashboard"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  title="Dashboard"
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
      id="text2"
      value="## {{ retoolContext.pages.find(page => page.isCurrentPage).title }}"
      verticalAlign="center"
    />
    <Icon
      id="icon2"
      horizontalAlign="center"
      icon="bold/interface-alert-warning-triangle"
      style={{ ordered: [{ color: "warning" }] }}
    />
    <Icon
      id="icon1"
      horizontalAlign="center"
      icon="bold/travel-wayfinder-rock-slide"
    />
    <Text
      id="text8"
      style={{
        ordered: [
          { fontSize: "h1Font" },
          { fontWeight: "h1Font" },
          { fontFamily: "h1Font" },
        ],
      }}
      value="Work in progress"
      verticalAlign="center"
    />
    <Text
      id="text9"
      horizontalAlign="center"
      style={{
        ordered: [
          { fontSize: "h6Font" },
          { fontWeight: "h6Font" },
          { fontFamily: "h6Font" },
          { color: "rgba(109, 109, 109, 1)" },
        ],
      }}
      value="(Ignore initial error notifications)"
      verticalAlign="center"
    />
    <FileDropzone
      id="fileDropzone1"
      _isUpgraded={true}
      appendNewSelection={true}
      disabled="true"
      label=""
      labelPosition="top"
      maxCount={20}
      maxSize="250mb"
      selectionType="multiple"
      style={{ ordered: [{ border: "rgba(0, 0, 0, 1)" }] }}
    />
  </Frame>
</Screen>
