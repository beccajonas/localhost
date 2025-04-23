<ModalFrame
  id="deleteImageAlert"
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
      id="modalTitle1"
      value="### Do you want to delete image?"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton1"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="deleteImageAlert"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <EditableText
      id="imageNameToDelete"
      inputTooltip="`Enter` to save, `Esc` to cancel"
      label="Name"
      placeholder="Enter value"
      readOnly="true"
      value="{{ imageListTable.selectedRow.name }}"
    />
    <EditableText
      id="imageVariantToDelete"
      inputTooltip="`Enter` to save, `Esc` to cancel"
      label="Variant"
      placeholder="Enter value"
      readOnly="true"
      value="{{ imageListTable.selectedRow.variant }}"
    />
    <EditableText
      id="editableText2"
      editIcon="bold/interface-edit-write-1"
      inputTooltip="`Enter` to save, `Esc` to cancel"
      label="ECR Repository"
      placeholder="Enter value"
      readOnly="true"
      value="{{ imageListTable.selectedRow.repositoryName }}"
    />
    <EditableText
      id="editableText3"
      editIcon="bold/interface-edit-write-1"
      inputTooltip="`Enter` to save, `Esc` to cancel"
      label="Build URL"
      placeholder="Enter value"
      readOnly="true"
      value="{{ imageListTable.selectedRow.buildUrl }}"
    />
    <EditableText
      id="editableText4"
      editIcon="bold/interface-edit-write-1"
      inputTooltip="`Enter` to save, `Esc` to cancel"
      label="Deploy URL"
      placeholder="Enter value"
      readOnly="true"
      value="{{ imageListTable.selectedRow.deployUrl }}"
    />
    <Container
      id="container5"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="{{ getDependentImagesForInternalImages.data.length === 0 }}"
      padding="12px"
      showBody={true}
      style={{ ordered: [{ background: "highlight" }] }}
    >
      <Header>
        <Text
          id="containerTitle7"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="d56c5" viewKey="View 1">
        <Text
          id="text17"
          value="**An image with dependent images can not be deleted, delete relations first**"
          verticalAlign="center"
        />
        <Table
          id="table5"
          actionsOverflowPosition={1}
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ getDependentImagesForInternalImages.data }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          emptyMessage="No rows found"
          enableSaveActions={true}
          primaryKeyColumnId="9c0b2"
          rowHeight="small"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          toolbarPosition="bottom"
        >
          <Column
            id="a6bd4"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="image"
            label="Image"
            placeholder="Select option"
            position="center"
            size={124.625}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
          />
          <Column
            id="4300f"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="variant"
            label="Variant"
            placeholder="Enter value"
            position="center"
            size={123.734375}
            summaryAggregationMode="none"
          />
          <Column
            id="9c0b2"
            alignment="left"
            editable={false}
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
          <Column
            id="762b3"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            hidden="true"
            key="dependencyName"
            label="Dependency name"
            placeholder="Select option"
            position="center"
            size={100}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
          />
          <Column
            id="0fbab"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            hidden="true"
            key="dependencyVariant"
            label="Dependency variant"
            placeholder="Select option"
            position="center"
            size={100}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
          />
          <Column
            id="eb33c"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="tag"
            label="Tag"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="09839"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="type"
            label="Type"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="bd8d1"
            alignment="left"
            format="datetime"
            groupAggregationMode="none"
            hidden="true"
            key="createdAt"
            label="Created at"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="59647"
            alignment="left"
            format="datetime"
            groupAggregationMode="none"
            hidden="true"
            key="updatedAt"
            label="Updated at"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Action
            id="c80e9"
            hidden="{{ currentRow.type !== 'internal' }}"
            icon="bold/interface-logout-circle-alternate"
            label="Go to image"
          >
            <Event
              event="clickAction"
              method="selectRow"
              params={{
                ordered: [
                  {
                    options: {
                      ordered: [
                        { mode: "key" },
                        { indexType: "data" },
                        { index: "{{ table5.selectedRow.key }}" },
                        { key: "{{ table5.selectedRowKey }}" },
                      ],
                    },
                  },
                ],
              }}
              pluginId="imageListTable"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="hide"
              params={{ ordered: [] }}
              pluginId="deleteImageAlert"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="show"
              params={{ ordered: [] }}
              pluginId="imageDetailsDrawer"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </Action>
        </Table>
      </View>
    </Container>
  </Body>
  <Footer>
    <Button id="button5" text="No, cancel">
      <Event
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="deleteImageAlert"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="button4"
      disabled="{{ getDependentImagesForInternalImages.isFetching || getDependentImagesForInternalImages.data.length > 0 }}"
      text="Yes, delete image"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="deleteImage"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</ModalFrame>
