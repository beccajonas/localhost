<ModalFrame
  id="addInternalDependencyModal"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showHeader={true}
  showOverlay={true}
  size="large"
>
  <Header>
    <Text
      id="modalTitle5"
      value="### Add internal dependency"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton5"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="clear"
        params={{ ordered: [] }}
        pluginId="addInternalDependencyForm"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="clearSelection"
        params={{ ordered: [] }}
        pluginId="selectImageTable"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="addInternalDependencyModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="showPreviousView"
        params={{ ordered: [] }}
        pluginId="steppedContainer1"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Include src="./steppedContainer1.rsx" />
  </Body>
</ModalFrame>
