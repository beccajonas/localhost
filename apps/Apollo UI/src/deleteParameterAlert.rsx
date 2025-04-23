<ModalFrame
  id="deleteParameterAlert"
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
      id="modalTitle11"
      value="### Delete parameter"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton11"
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
        pluginId="deleteParameterAlert"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Text
      id="text23"
      value="Are you sure you want to delete the following parameter from `{{ currentImageName.value }}-{{ currentImageVariant.value }}`"
      verticalAlign="center"
    />
    <Container
      id="container6"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      style={{ ordered: [{ background: "highlight" }] }}
    >
      <Header>
        <Text
          id="containerTitle8"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="25c94" viewKey="View 1">
        <EditableText
          id="parameterToDeleteName"
          label="Name"
          placeholder="Enter value"
          readOnly="true"
          style={{ ordered: [] }}
          value="{{parameterListTable.selectedRow.name}}"
        />
        <EditableText
          id="editableText24"
          label="Value"
          placeholder="Enter value"
          readOnly="true"
          style={{ ordered: [] }}
          value="{{ parameterListTable.selectedRow.value }}"
        />
      </View>
    </Container>
  </Body>
  <Footer>
    <Button
      id="button29"
      style={{ ordered: [] }}
      styleVariant="outline"
      text="Cancel"
    >
      <Event
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="deleteParameterAlert"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="button28"
      loading="{{ deleteParameter.isFetching }}"
      style={{ ordered: [{ background: "danger" }] }}
      text="Delete"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="deleteParameter"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</ModalFrame>
