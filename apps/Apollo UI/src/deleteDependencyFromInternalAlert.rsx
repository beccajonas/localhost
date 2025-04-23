<ModalFrame
  id="deleteDependencyFromInternalAlert"
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
      id="modalTitle8"
      value="### Delete dependency"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton8"
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
        pluginId="deleteDependencyFromInternalAlert"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Form
      id="deleteDependecyFormInternal"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
    >
      <Header>
        <Text id="formTitle11" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <EditableText
          id="editableText18"
          editIcon="bold/interface-edit-write-1"
          formDataKey="imageName"
          inputTooltip="`Enter` to save, `Esc` to cancel"
          label="Image name"
          placeholder="Enter value"
          readOnly="true"
          value="{{ url.hashParams.image }}"
        />
        <EditableText
          id="editableText19"
          editIcon="bold/interface-edit-write-1"
          formDataKey="imageVariant"
          inputTooltip="`Enter` to save, `Esc` to cancel"
          label="Image variant"
          placeholder="Enter value"
          readOnly="true"
          value="{{ url.hashParams.variant }}"
        />
        <EditableText
          id="editableText20"
          editIcon="bold/interface-edit-write-1"
          formDataKey="dependencyName"
          inputTooltip="`Enter` to save, `Esc` to cancel"
          label="Dependency name"
          placeholder="Enter value"
          readOnly="true"
          value="{{ dependenciesListTable.selectedRow?.dependencyName }}"
        />
        <EditableText
          id="editableText21"
          editIcon="bold/interface-edit-write-1"
          formDataKey="dependencyVariant"
          inputTooltip="`Enter` to save, `Esc` to cancel"
          label="Dependency variant"
          placeholder="Enter value"
          readOnly="true"
          value="{{ dependenciesListTable.selectedRow?.dependencyVariant }}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton11"
          submit={true}
          submitTargetId="deleteDependecyFormInternal"
          text="Submit"
        />
      </Footer>
    </Form>
  </Body>
  <Footer>
    <Button
      id="button24"
      style={{ ordered: [] }}
      styleVariant="outline"
      text="Cancel"
    >
      <Event
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="deleteDependencyFromInternalAlert"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="button23"
      style={{ ordered: [{ background: "danger" }] }}
      text="Delete"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="deleteDependencyInternalImage"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</ModalFrame>
