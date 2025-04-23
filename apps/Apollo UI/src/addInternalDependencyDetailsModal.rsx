<ModalFrame
  id="addInternalDependencyDetailsModal"
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
      id="modalTitle16"
      value="### Dependencency details"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton16"
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
        pluginId="addInternalDependencyDetailsModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Form
      id="addInternalDependencyForm2"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden=""
      hoistFetching={true}
      loading=""
      padding="12px"
      requireValidation={true}
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text id="formTitle16" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <EditableText
          id="editableText38"
          formDataKey="dependencyName"
          label="Name"
          placeholder="Enter value"
          readOnly="true"
          value="{{ selectInternalTable.selectedRow?.name }}"
        />
        <EditableText
          id="editableText39"
          formDataKey="dependencyVariant"
          label="Variant"
          placeholder="Enter value"
          readOnly="true"
          value="{{ selectInternalTable.selectedRow?.variant }}"
        />
        <EditableText
          id="editableText40"
          formDataKey="repository"
          label="Repository"
          placeholder="Enter value"
          readOnly="true"
          value="{{ selectInternalTable.selectedRow?.repositoryName }}"
        />
        <Select
          id="selectPossibleTag2"
          data="{{ getRepositoryDetails2.data }}"
          emptyMessage="No options"
          formDataKey="selectedTag"
          hidden="{{ getRepositoryDetails2.data?.length === 0 }}"
          label="Select tag"
          labels="{{ item.tags.join('/') }} - {{ new Date(item.pushedAt).toDateString() }}"
          overlayMaxHeight={375}
          placeholder="Select a tag"
          showClear={true}
          showSelectionIndicator={true}
          value=""
          values="{{ item.tags.join('/') }}"
        />
        <Container
          id="container17"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          hidden="{{ getRepositoryDetails2.data?.length !== 0 }}"
          padding="12px"
          showBody={true}
          style={{ ordered: [{ background: "highlight" }] }}
        >
          <Header>
            <Text
              id="containerTitle22"
              value="#### Container title"
              verticalAlign="center"
            />
          </Header>
          <View id="61995" viewKey="View 1">
            <Text
              id="text44"
              value="**This image does not have versions available**"
              verticalAlign="center"
            />
          </View>
        </Container>
      </Body>
      <Footer>
        <Button
          id="formButton16"
          submit={true}
          submitTargetId="addInternalDependencyForm2"
          text="Submit"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="addInternalDependency"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </Body>
  <Footer>
    <Button
      id="button44"
      disabled="{{ !addInternalDependencyForm2.data.selectedTag || getRepositoryDetails2.data?.length === 0 }}"
      text="Add dependency"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="addInternalDependency2"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</ModalFrame>
