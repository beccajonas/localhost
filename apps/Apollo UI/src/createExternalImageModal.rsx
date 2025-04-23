<ModalFrame
  id="createExternalImageModal"
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
    <Text id="modalTitle3" value="### Add Repository" verticalAlign="center" />
    <Button
      id="modalCloseButton3"
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
        pluginId="createExternalImageModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Form
      id="createExternalImageForm"
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
        <Text id="formTitle7" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <TextInput
          id="textInput24"
          customValidation={
            '{{ textInput24.value.includes(" ") ? "Name should not have spaces" : ""}}'
          }
          formDataKey="name"
          label="Name"
          placeholder="Ex: node"
          required={true}
        />
        <Text
          id="text11"
          style={{ ordered: [{ color: "rgba(143, 143, 143, 1)" }] }}
          value="Internal name of the Image.
Examples: node, atlantis, jenkins"
          verticalAlign="center"
        />
        <TextInput
          id="textInput27"
          formDataKey="hubUrl"
          iconBefore="bold/interface-link"
          label="Hub URL"
          patternType="url"
          placeholder="Ex: https://hub.docker.com/_/node"
        />
        <TextInput
          id="textInput32"
          customValidation={
            '{{ textInput32.value.includes(" ") ? "Variant should not have spaces" : ""}}'
          }
          formDataKey="variant"
          label="Variant"
          placeholder="Ex: alpine"
        />
        <Text
          id="text12"
          style={{ ordered: [{ color: "rgba(143, 143, 143, 1)" }] }}
          value="Variant of the Image in Dockerhub. If empty it will point to default one.
Examples: slim, alpine, bullseye."
          verticalAlign="center"
        />
        <TextInput
          id="textInput25"
          customValidation={
            '{{ textInput25.value.includes(" ") ? "Namespace should not have spaces" : ""}}'
          }
          formDataKey="namespace"
          label="Namespace"
          placeholder="Ex: library"
          value="{{ textInput27.value?.split('/')[3] ? textInput27.value?.split('/')[3] === '_' ? 'library' : textInput27.value?.split('/')[3] : '' }}"
        />
        <Text
          id="text13"
          style={{ ordered: [{ color: "rgba(143, 143, 143, 1)" }] }}
          value={
            'Namespace of Repository in Dockerhub.If "_" or none is provided it is default.'
          }
          verticalAlign="center"
        />
        <TextInput
          id="textInput26"
          customValidation={
            '{{ textInput26.value.includes(" ") ? "Repository name should not have spaces" : ""}}'
          }
          formDataKey="repository"
          label="Repository"
          placeholder="Ex: node"
          required={true}
          value="{{ textInput27.value?.split('/')[4] ?? '' }}"
        />
        <Text
          id="text26"
          style={{ ordered: [{ color: "rgba(143, 143, 143, 1)" }] }}
          value="Name of Repository in Dockerhub.
Examples: node, python"
          verticalAlign="center"
        />
      </Body>
      <Footer>
        <Button
          id="formButton7"
          submit={true}
          submitTargetId="createExternalImageForm"
          text="Submit"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="createExternalImage"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </Body>
  <Footer>
    <Button
      id="button9"
      submit={true}
      submitTargetId="createExternalImageForm"
      text="Add Repository"
    />
  </Footer>
</ModalFrame>
