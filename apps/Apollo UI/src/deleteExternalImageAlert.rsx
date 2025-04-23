<ModalFrame
  id="deleteExternalImageAlert"
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
>
  <Header>
    <Text
      id="modalTitle4"
      value="### Do you want to delete this image?"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton4"
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
        pluginId="deleteExternalImageAlert"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <EditableText
      id="externalImageNameToDelete"
      label="Image name"
      placeholder="Enter value"
      readOnly="true"
      value="{{ externalImageTable.selectedRow.name }}"
    />
    <EditableText
      id="externalImageVariantToDelete"
      label="Image variant"
      placeholder="Enter value"
      readOnly="true"
      value="{{ externalImageTable.selectedRow.variant }}"
    />
    <Container
      id="container4"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="{{ getDependentImages.data.length === 0 }}"
      padding="12px"
      showBody={true}
      style={{ ordered: [{ background: "highlight" }] }}
    >
      <Header>
        <Text
          id="containerTitle6"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="769af" viewKey="View 1">
        <Text
          id="text16"
          value="An image with dependent images can not be deleted, delete relations first"
          verticalAlign="center"
        />
        <Table
          id="table3"
          actionsOverflowPosition={2}
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ getDependentImages.data }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          emptyMessage="No rows found"
          enableSaveActions={true}
          rowHeight="small"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          toolbarPosition="bottom"
        >
          <Column
            id="21d2f"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="image"
            label="Image"
            placeholder="Enter value"
            position="center"
            size={84.671875}
            summaryAggregationMode="none"
          />
          <Column
            id="9f221"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="variant"
            label="Variant"
            placeholder="Enter value"
            position="center"
            size={55.734375}
            summaryAggregationMode="none"
          />
          <Column
            id="e1c2e"
            alignment="left"
            editable="false"
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="key"
            label="Key"
            placeholder="Enter value"
            position="center"
            size={83.921875}
            summaryAggregationMode="none"
          />
          <Action
            id="e1c95"
            icon="bold/interface-logout-circle-alternate"
            label="Go to dependency"
          >
            <Event
              event="clickAction"
              method="openPage"
              params={{
                ordered: [
                  { pageName: "images" },
                  {
                    options: {
                      ordered: [
                        {
                          queryParams: [
                            {
                              ordered: [
                                { key: "image" },
                                { value: "{{ currentRow.image }}" },
                              ],
                            },
                            {
                              ordered: [
                                { key: "variant" },
                                { value: "{{ currentRow.variant }}" },
                              ],
                            },
                          ],
                        },
                      ],
                    },
                  },
                ],
              }}
              pluginId=""
              type="util"
              waitMs="0"
              waitType="debounce"
            />
          </Action>
          <Action
            id="aed0d"
            icon="bold/interface-delete-bin-2"
            label="Delete dependency"
          >
            <Event
              event="clickAction"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="deleteDependencyInDeleteImageModal"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
          </Action>
        </Table>
      </View>
    </Container>
  </Body>
  <Footer>
    <Button id="button11" text="No, cancel">
      <Event
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="deleteExternalImageAlert"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="button10"
      disabled="{{ getDependentImages.isFetching || getDependentImages.data.length > 0 }}"
      text="Yes, delete"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="deleteExternalImage"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</ModalFrame>
