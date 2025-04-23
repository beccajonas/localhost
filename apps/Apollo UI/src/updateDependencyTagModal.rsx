<ModalFrame
  id="updateDependencyTagModal"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showFooter={true}
  showHeader={true}
  showOverlay={true}
  size="medium"
>
  <Header>
    <Text
      id="modalTitle14"
      value="### Update `{{ dependenciesListTable.selectedRow.dependencyName }}:{{ dependenciesListTable.selectedRow.dependencyVariant }}` dependency for `{{ url.hashParams.image }}/{{ url.hashParams.variant }}`"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton14"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="updateDependencyTagModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <TextInput
      id="textInput43"
      hidden="{{ dependenciesListTable.selectedRow.type === 'internal' }}"
      label="Tag"
      placeholder="Enter new tag"
      value="{{ dependenciesListTable.selectedRow.tag }}"
    />
    <Select
      id="select1"
      data="{{ getRepositoryDetails4.data }}"
      emptyMessage="No options"
      hidden="{{ dependenciesListTable.selectedRow.type === 'external' }}"
      label="Tag"
      labels="{{ item.tags.join('/') }} - {{ new Date(item.pushedAt).toDateString() }}"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showSelectionIndicator={true}
      value="{{ dependenciesListTable.selectedRow.tag }}"
      values="{{ item.tags.join('/') }}"
    />
  </Body>
  <Footer>
    <Button
      id="button37"
      disabled="{{ dependenciesListTable.selectedRow.type === 'internal' ?  select1.selectedItem.tags.join('/') === dependenciesListTable.selectedRow.tag : textInput43.value === dependenciesListTable.selectedRow.tag }}"
      loading="{{ updateDependency.isFetching }}"
      text="Update"
    >
      <Event
        enabled="{{ textInput43.value !== dependenciesListTable.selectedRow.tag }}"
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="updateDependency"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</ModalFrame>
