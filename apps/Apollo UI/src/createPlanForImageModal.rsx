<ModalFrame
  id="createPlanForImageModal"
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
      id="modalTitle13"
      value="### Create plan for `{{ url.hashParams.image }}/{{ url.hashParams.variant }}`"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton13"
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
        pluginId="createPlanForImageModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Form
      id="createPlanForm"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text id="formTitle14" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <TextInput
          id="textInput42"
          formDataKey="tag"
          label="Tag"
          placeholder="Ex: 1.0.0"
        />
        <Checkbox
          id="checkbox1"
          formDataKey="lastest"
          label="Latest"
          labelWidth="100"
        />
      </Body>
      <Footer>
        <Button
          id="formButton14"
          submit={true}
          submitTargetId="createPlanForm"
          text="Submit"
        />
      </Footer>
    </Form>
  </Body>
  <Footer>
    <Button id="button32" text="Create plan">
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="createPlan"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</ModalFrame>
