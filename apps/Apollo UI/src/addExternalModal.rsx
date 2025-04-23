<ModalFrame
  id="addExternalModal"
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
      id="modalTitle18"
      value="### Dependency details"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton18"
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
        pluginId="addExternalModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Form
      id="addExternalDependencyForm2"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden=""
      padding="12px"
      requireValidation={true}
      showBody={true}
    >
      <Header>
        <Text id="formTitle17" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <EditableText
          id="editableText41"
          formDataKey="dependencyName"
          label="Name"
          placeholder="Enter value"
          value="{{ table7.selectedRow.name }}"
        />
        <EditableText
          id="editableText42"
          formDataKey="dependencyVariant"
          label="Variant"
          placeholder="Enter value"
          value="{{ table7.selectedRow.variant }}"
        />
        <TextInput
          id="textInput52"
          formDataKey="tag"
          hidden="false"
          label="Tag"
          placeholder="Enter value"
        />
      </Body>
      <Footer>
        <Button
          id="formButton17"
          submit={true}
          submitTargetId="addExternalDependencyForm2"
          text="Submit"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="addExternalDependency2"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </Body>
  <Footer>
    <Button
      id="button46"
      submit={true}
      submitTargetId="addExternalDependencyForm2"
      text="Add dependency"
    />
  </Footer>
</ModalFrame>
