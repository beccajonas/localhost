<ModalFrame
  id="oktaModal"
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
  size="large"
>
  <Header>
    <Text
      id="modalTitle12"
      value="### Container title"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton12"
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
        pluginId="oktaModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <HTML
      id="html1"
      css={include("../lib/html1.css", "string")}
      html="{{ auth.data.message }}"
    />
  </Body>
</ModalFrame>
