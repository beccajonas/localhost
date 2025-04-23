<ModalFrame
  id="createParameterModal"
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
      id="modalTitle9"
      value="### Create Parameter"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton9"
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
        pluginId="createParameterModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Form
      id="createParameterForm"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text id="formTitle12" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <TextInput
          id="textInput34"
          customValidation={
            '{{ textInput34.value.includes(" ") ? "Name should not have spaces" : ""}}'
          }
          formDataKey="name"
          label="Name"
          labelCaption="Alphanumeric and underscore characters allowed; the first character must be a letter or an underscore"
          labelPosition="top"
          labelWrap={true}
          pattern="^[a-zA-Z_][a-zA-Z0-9_]*$"
          patternType="regex"
          placeholder="Ex: MY_VAR, userName, _config"
          required={true}
        />
        <TextInput
          id="textInput35"
          customValidation={
            '{{ textInput35.value.includes(" ") ? "Value should not have spaces" : ""}}'
          }
          formDataKey="value"
          label="Value"
          labelPosition="top"
          placeholder="Ex: 22.3.12"
          required={true}
        />
      </Body>
      <Footer>
        <Button
          id="formButton12"
          submit={true}
          submitTargetId="createParameterForm"
          text="Submit"
        />
      </Footer>
    </Form>
  </Body>
  <Footer>
    <Button
      id="button26"
      loading="{{ createParameter.isFetching }}"
      text="Create"
    >
      <Event
        enabled="{{ !createParameterForm.invalid }}"
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="createParameter"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="validate"
        params={{ ordered: [] }}
        pluginId="createParameterForm"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</ModalFrame>
