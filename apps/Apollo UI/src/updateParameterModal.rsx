<ModalFrame
  id="updateParameterModal"
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
      id="modalTitle10"
      value="### Edit `{{ parametersListTable.selectedRow.name }}`"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton10"
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
        pluginId="updateParameterModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Form
      id="updateParameterForm"
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
        <Text id="formTitle13" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <TextInput
          id="textInput38"
          formDataKey="name"
          hidden="true"
          label="Parameter Name"
          labelPosition="top"
          placeholder="Enter value"
          value="{{ parametersListTable.selectedRow.name }}"
        />
        <TextInput
          id="textInput37"
          customValidation="{{ textInput37.value === parametersListTable.selectedRow.value ? 'The new value should be different from the initial one' : updateParameterForm.data.value.includes(' ') ? 'The new value should not have spaces' : '' }}"
          formDataKey="value"
          label="Parameter Value"
          labelPosition="top"
          placeholder="Enter value"
          required={true}
          value="{{ parametersListTable.selectedRow?.value }}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton13"
          submit={true}
          submitTargetId="updateParameterForm"
          text="Submit"
        />
      </Footer>
    </Form>
  </Body>
  <Footer>
    <Button
      id="button27"
      disabled="{{ updateParameterForm.invalid }}"
      loading="{{ updateParameter.isFetching }}"
      text="Update"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="updateParameter"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</ModalFrame>
