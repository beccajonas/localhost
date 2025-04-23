<ModalFrame
  id="deleteDependencyAlert"
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
      id="modalTitle7"
      value="### Delete dependency?"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton7"
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
        pluginId="deleteDependencyAlert"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Form
      id="deleteDependencyForm"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text id="formTitle10" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <EditableText
          id="editableText14"
          formDataKey="image"
          label="Image name"
          placeholder="Enter value"
          readOnly="true"
          value="{{ dependentImagesTable.selectedRow.image }}"
        />
        <EditableText
          id="editableText15"
          formDataKey="variant"
          label="Image variant"
          placeholder="Enter value"
          readOnly="true"
          value="{{ dependentImagesTable.selectedRow.variant }}"
        />
        <EditableText
          id="editableText16"
          formDataKey="dependencyName"
          label="Dependency name"
          placeholder="Enter value"
          readOnly="true"
          value="{{ dependentImagesTable.selectedRow.dependencyName }}"
        />
        <EditableText
          id="editableText17"
          formDataKey="dependencyVariant"
          label="Dependency variant"
          placeholder="Enter value"
          readOnly="true"
          value="{{ dependentImagesTable.selectedRow.dependencyVariant }}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton10"
          submit={true}
          submitTargetId="deleteDependencyForm"
          text="Submit"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="deleteDependency"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </Body>
  <Footer>
    <Button
      id="button20"
      style={{ ordered: [] }}
      styleVariant="outline"
      text="Cancel"
    >
      <Event
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="deleteDependencyAlert"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="button19"
      submit={true}
      submitTargetId="deleteDependencyForm"
      text="Delete"
    />
  </Footer>
</ModalFrame>
