<ModalFrame
  id="changeSelectedRepository"
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
      id="modalTitle15"
      value="### Change repository"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton15"
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
        pluginId="changeSelectedRepository"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Text
      id="text28"
      horizontalAlign="center"
      value="### {{ getImageDetails.data?.repositoryName }} ---> {{ editRegistryTable.selectedRow?.name || getImageDetails.data?.repositoryName }} "
      verticalAlign="center"
    />
    <Table
      id="editRegistryTable"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ listRegistryForSelect2.data?.data }}"
      defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      groupByColumns={{}}
      hasNextPage="{{  !!registryCursorDirectory2.value.get(editRegistryTable?.pagination?.currentPage + 1)}}"
      heightType="auto"
      nextAfterCursor="{{  registryCursorDirectory2.value.get(editRegistryTable?.pagination?.currentPage + 1)}}"
      overflowType="pagination"
      primaryKeyColumnId="379ca"
      serverPaginated={true}
      serverPaginationType="forwardCursorBased"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      templatePageSize="10"
      toolbarPosition="bottom"
    >
      <Column
        id="379ca"
        alignment="left"
        editable={false}
        format="string"
        groupAggregationMode="none"
        key="name"
        label="Name"
        placeholder="Enter value"
        position="center"
        size={324.875}
      />
      <Column
        id="63ab7"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        hidden="true"
        key="immutable"
        label="Immutable"
        placeholder="Select option"
        position="center"
        size={101.9375}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="b58f4"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        key="createdAt"
        label="Created at"
        placeholder="Enter value"
        position="center"
        size={148.15625}
      />
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="refresh"
          pluginId="editRegistryTable"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <Event
        event="changePage"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="listRegistryForSelect2"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
  </Body>
  <Footer>
    <Button id="button42" text="Save change">
      <Event
        event="click"
        method="setValue"
        params={{
          ordered: [{ value: "{{ editRegistryTable.selectedRow?.name }}" }],
        }}
        pluginId="editableText35"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="changeSelectedRepository"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</ModalFrame>
