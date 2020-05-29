# Shell CheatSheet

<table>

<thead><tr>
    <th><pre>cmd</pre></th>
    <th>Description</th>
</tr></thead>

<tbody><tr>

<td>

```shell
${var#sth}
${var##sth}
```

</td><td>

Remove `"sth"` from the **beginning** of `$var`, Example:

```shell
var="abc abc"

echo "${var#*b}"  # -> "c abc"
echo "${var##*b}" # -> "c"
```

</td>
</tr><tr>
<td>
 
```shell
${var%sth}
${var%%sth}
```
 
</td><td>
 
Remove `"sth"` from the **end** of `$var`, Example:
 
```shell
var="abc abc"

echo "${var%b*}"  # -> "abc a"
echo "${var%%b*}" # -> "a"
```
 
</td>
</tr></tbody>

</table>
