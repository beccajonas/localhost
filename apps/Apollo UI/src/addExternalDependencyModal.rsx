<ModalFrame
  id="addExternalDependencyModal"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="0"
  showHeader={true}
  showOverlay={true}
  size="large"
>
  <Header>
    <Text
      id="modalTitle6"
      value="### Add external dependency"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton6"
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
        pluginId="addExternalDependencyModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setCurrentViewIndex"
        params={{ ordered: [{ viewIndex: "0" }] }}
        pluginId="steppedContainer3"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="clear"
        params={{ ordered: [] }}
        pluginId="addExternalDependencyForm"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Include src="./steppedContainer3.rsx" />
  </Body>
  <Footer>
    <Button
      id="button18"
      style={{ ordered: [] }}
      styleVariant="outline"
      text="Cancel"
    >
      <Event
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="addExternalDependencyModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="reset"
        params={{ ordered: [] }}
        pluginId="addExternalDependencyForm"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="resetValue"
        params={{ ordered: [] }}
        pluginId="selectedExternalImage"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</ModalFrame>
