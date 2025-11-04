-- Pandoc-papers lua filter
-- Aliaume LOPEZ
-- 2025
-- GPLv3
--
-- This filter is used to parse authors in the format of `./paper-meta.schema.json`
-- and add to the metadata a (numbered) list of affiliations and add to authors
-- the affiliation's indices.
--
-- This can be useful for some journals that require writing latex of the form 
--
-- ```latex
-- \author{name \inst{1} \and name \inst{1,2} \and name \inst{2}}
-- \institute{ ... \and ... }
-- ```

-- Access the author (list) from the metadata, always return a list
local function get_authors(meta)
  if meta.author == nil then
    return pandoc.List {}
  end
  if pandoc.utils.type(meta.author) == "table" then
    local l = pandoc.List {}
    l:insert(meta.author)
    return l
  else
    return meta.author
  end
end

-- Access the affiliations of a given author, always returns a list
-- If no affiliation is found, return an empty list
local function get_author_affiliations(author)
  if author["affiliation"] == nil then
    return pandoc.List {}
  end
  if pandoc.utils.type(author["affiliation"]) == "table" then
    local l = pandoc.List {}
    l:insert(author["affiliation"])
    return l
  else
    return author["affiliation"]
  end
end

-- Create a unique list of affiliations from the authors list
local function collect_affiliations(authors)
  local affiliation_map  = {}
  local affiliation_list = {}
  local index = 1
  for _, author in ipairs(authors) do
    local author_affiliations = get_author_affiliations(author)
    for _, aff in ipairs(author_affiliations) do
      local aff_str = pandoc.utils.stringify(aff)
      if affiliation_map[aff_str] == nil then
        affiliation_map[aff_str] = index
        affiliation_list[index] = aff
        index = index + 1
      end
    end
  end
  return affiliation_map, affiliation_list
end 

-- Update authors with affiliation indices
-- > for each author, for each affiliation, add the index to its metavalue
local function update_authors_with_indices(authors, affiliation_map)
  for _, author in ipairs(authors) do
    local author_affiliations = get_author_affiliations(author)
    for _, aff in ipairs(author_affiliations) do
      local aff_str = pandoc.utils.stringify(aff)
      aff["index"] = affiliation_map[aff_str]
    end
  end
end

-- Main function to process metadata
function Meta(meta)
  local authors = get_authors(meta)
  local affiliation_map, affiliation_list = collect_affiliations(authors)
  update_authors_with_indices(authors, affiliation_map)
  meta["author"] = authors
  meta["affiliation"] = affiliation_list
  return meta
end

return {
  { Meta = Meta }
}
