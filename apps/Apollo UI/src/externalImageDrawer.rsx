<DrawerFrame
  id="externalImageDrawer"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showFooter="{{ actAsAdmin.value }}"
  showHeader={true}
  showOverlay={true}
  width="medium"
>
  <Header>
    <Text id="drawerTitle2" value="### External Image" verticalAlign="center" />
    <Button
      id="drawerCloseButton2"
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
        pluginId="externalImageDrawer"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <EditableText
      id="editableText5"
      label="Name"
      placeholder="Enter value"
      readOnly="true"
      value="{{ getExternalImageDetails.data?.name }}"
    />
    <EditableText
      id="editableText6"
      label="Variant"
      placeholder="Enter value"
      readOnly="true"
      value="{{ getExternalImageDetails.data?.variant }}"
    />
    <EditableText
      id="editableText7"
      label="Namespace"
      placeholder="Enter value"
      readOnly="true"
      value="{{ getExternalImageDetails.data?.namespace }}"
    />
    <EditableText
      id="editableText8"
      label="Repository"
      placeholder="Enter value"
      readOnly="true"
      value="{{ getExternalImageDetails.data?.repository }}"
    />
    <EditableText
      id="editableText9"
      label="Hub Url"
      placeholder="Enter value"
      readOnly="true"
      style={{ ordered: [{ baseText: "primary" }] }}
      value="{{ getExternalImageDetails.data?.hubUrl }}"
    />
    <Container
      id="container3"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      overflowType="hidden"
      padding="0"
      showBody={true}
      showBorder={false}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle3"
          value="#### Dependent images"
          verticalAlign="center"
        />
      </Header>
      <View id="f4fd1" viewKey="View 1">
        <Table
          id="dependentImagesTable"
          actionsOverflowPosition={2}
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ getDependentImages.data?.data ?? [] }}"
          defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
          emptyMessage="No rows found"
          enableSaveActions={true}
          groupByColumns={{}}
          hasNextPage="{{ !!dependentsCursorDirectory2.value.get(dependentImagesTable?.pagination?.currentPage + 1) }}"
          heightType="auto"
          nextAfterCursor="{{ dependentsCursorDirectory2.value.get(dependentImagesTable?.pagination?.currentPage + 1) }}"
          overflowType="pagination"
          primaryKeyColumnId="64f34"
          rowHeight="medium"
          serverPaginated={true}
          serverPaginationType="forwardCursorBased"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          templatePageSize="10"
          toolbarPosition="bottom"
        >
          <Column
            id="a50ea"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="image"
            label="Image"
            placeholder="Enter value"
            position="center"
            size={155.890625}
          />
          <Column
            id="da464"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="variant"
            label="Variant"
            placeholder="Enter value"
            position="center"
            size={55.71875}
          />
          <Column
            id="3b4c7"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="dependencyName"
            label="Dependency name"
            placeholder="Enter value"
            position="center"
            size={122.34375}
          />
          <Column
            id="ea5fc"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="dependencyVariant"
            label="Dependency variant"
            placeholder="Enter value"
            position="center"
            size={129.84375}
          />
          <Column
            id="47ffc"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="type"
            label="Type"
            placeholder="Enter value"
            position="center"
            size={61.671875}
          />
          <Column
            id="f1ef9"
            alignment="left"
            format="datetime"
            groupAggregationMode="none"
            hidden="true"
            key="createdAt"
            label="Created at"
            placeholder="Enter value"
            position="center"
            size={136.453125}
          />
          <Column
            id="78281"
            alignment="left"
            format="datetime"
            groupAggregationMode="none"
            hidden="true"
            key="updatedAt"
            label="Updated at"
            placeholder="Enter value"
            position="center"
            size={136.453125}
          />
          <Column
            id="64f34"
            alignment="left"
            editable={false}
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="key"
            label="Key"
            placeholder="Enter value"
            position="center"
            size={102.953125}
          />
          <Column
            id="49ead"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="tag"
            label="Tag"
            placeholder="Enter value"
            position="center"
            size={100}
          />
          <Action
            id="74f7a"
            icon="bold/interface-logout-circle-alternate"
            label="Go to {{ currentRow?.key }}"
          >
            <Event
              event="clickAction"
              method="openPage"
              params={{
                ordered: [
                  {
                    options: {
                      ordered: [
                        { queryParams: [] },
                        { passDataWith: "urlParams" },
                        {
                          hashParams: [
                            {
                              ordered: [
                                { key: "image" },
                                { value: "{{ currentRow?.image }}" },
                              ],
                            },
                            {
                              ordered: [
                                { key: "variant" },
                                { value: "{{ currentRow?.variant }}" },
                              ],
                            },
                          ],
                        },
                        { persistUrlParams: false },
                      ],
                    },
                  },
                  { pageName: "imageDetails" },
                ],
              }}
              pluginId=""
              type="util"
              waitMs="0"
              waitType="debounce"
            />
          </Action>
          <Action
            id="ace83"
            hidden="{{ !actAsAdmin.value }}"
            icon="bold/interface-delete-bin-2"
            label="Delete dependency"
          >
            <Event
              event="clickAction"
              method="show"
              params={{ ordered: [] }}
              pluginId="deleteDependencyAlert"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </Action>
          <Event
            event="changePage"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="getDependentImages"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Table>
      </View>
    </Container>
  </Body>
  <Footer>
    <Button
      id="button13"
      style={{ ordered: [] }}
      styleVariant="outline"
      text="Delete"
    >
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="deleteExternalImageAlert"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
  <Event
    event="show"
    method="trigger"
    params={{ ordered: [] }}
    pluginId=""
    type="datasource"
    waitMs="0"
    waitType="debounce"
  />
</DrawerFrame>
